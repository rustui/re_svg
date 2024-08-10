import 'dart:async';
import 'dart:ffi' hide Size;
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:ffi/ffi.dart';

import 'resvg_bindings_generated.dart';

class _ReSvgSync {
  final Pointer<Pointer<resvg_render_tree>> _tree;
  final Size size;
  final resvg_transform _transform;
  bool _closed = false;
  _ReSvgSync._(this._tree, this.size, this._transform);

  static _ReSvgSync from(String data) {
    final str = data.toNativeUtf8();
    final options = _bindings.resvg_options_create();
    final tree = malloc<Pointer<resvg_render_tree>>();
    _bindings.resvg_parse_tree_from_data(str.cast(), str.length, options, tree);
    _bindings.resvg_options_destroy(options);

    final rawSize = _bindings.resvg_get_image_size(tree.value);
    final size = Size(rawSize.width, rawSize.height);

    final transform = _bindings.resvg_transform_identity();

    return _ReSvgSync._(tree, size, transform);
  }

  (Pointer<Uint8>, int)? render(int width, int height) {
    if (_closed) return null;
    _transform.a = width / size.width;
    _transform.d = height / size.height;
    final length = width * height * 4;
    final pixels = malloc<Uint8>(length);
    _bindings.resvg_render(
        _tree.value, _transform, width, height, pixels.cast());

    return (pixels, length);
  }

  void close() {
    if (!_closed) {
      _closed = true;
      _bindings.resvg_tree_destroy(_tree.value);
      malloc.free(_tree);
    }
  }
}

class ReSvg {
  final SendPort _commands;
  final ReceivePort _responses;
  final Map<int, Completer<Object?>> _activeRequests = {};
  int _idCounter = 0;
  bool _closed = false;

  Future<Image?> render(int width, int height) async {
    if (_closed) return null;
    final completer = Completer<Image?>.sync();
    final id = _idCounter++;
    _activeRequests[id] = completer;
    _commands.send(_RenderRequest(id, width, height));
    return await completer.future;
  }

  Future<Size?> getSize() async {
    if (_closed) return null;
    final completer = Completer<Size?>.sync();
    final id = _idCounter++;
    _activeRequests[id] = completer;
    _commands.send(_SizeRequest(id));
    return await completer.future;
  }

  static Future<ReSvg> spawn(String data) async {
    final initPort = RawReceivePort();
    final connection = Completer<(ReceivePort, SendPort)>.sync();
    initPort.handler = (initialMessage) {
      final commandPort = initialMessage as SendPort;
      connection.complete((
        ReceivePort.fromRawReceivePort(initPort),
        commandPort,
      ));
    };

    try {
      await Isolate.spawn(_startRemoteIsolate, initPort.sendPort);
    } on Object {
      initPort.close();
      rethrow;
    }

    final (ReceivePort receivePort, SendPort sendPort) =
        await connection.future;

    sendPort.send(_CreateRequest(data));

    return ReSvg._(receivePort, sendPort);
  }

  ReSvg._(this._responses, this._commands) {
    _responses.listen(_handleResponsesFromIsolate);
  }

  void _handleResponsesFromIsolate(dynamic message) {
    if (message is _Identifiable) {
      final completer = _activeRequests.remove(message.id);
      if (completer != null) {
        if (message is _RenderResponse) {
          final pixels = message.pixels;
          if (pixels == null) {
            completer.complete(null);
          } else {
            decodeImageFromPixels(pixels.asTypedList(message.length),
                message.width, message.height, PixelFormat.rgba8888, (image) {
              malloc.free(pixels);
              completer.complete(image);
            });
          }
        } else if (message is _SizeResponse) {
          completer.complete(message.size);
        }
      }
    }

    if (_closed && _activeRequests.isEmpty) _responses.close();
  }

  static void _startRemoteIsolate(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    _ReSvgSync? rss;
    receivePort.listen((message) {
      if (message is _Shutdown) {
        receivePort.close();
        rss?.close();
      } else if (message is _CreateRequest) {
        rss = _ReSvgSync.from(message.data);
      } else if (message is _RenderRequest) {
        final result = rss?.render(message.width, message.height);
        if (result == null) {
          sendPort.send(_RenderResponse(message.id, null, 0, 0, 0));
        } else {
          final (pixels, length) = result;
          sendPort.send(_RenderResponse(
              message.id, pixels, length, message.width, message.height));
          // decodeImageFromPixels(pixels.asTypedList(length), message.width,
          //     message.height, PixelFormat.rgba8888, (image) {
          //   malloc.free(pixels);
          //   sendPort.send(_RenderResponse(message.id, image));
          // });
        }
      } else if (message is _SizeRequest) {
        sendPort.send(_SizeResponse(message.id, rss?.size));
      }
    });
  }

  void close() {
    if (!_closed) {
      _closed = true;
      _commands.send(_Shutdown());
      if (_activeRequests.isEmpty) _responses.close();
    }
  }
}

const String _libName = 'resvg';

/// The dynamic library in which the symbols for [ResvgFfiBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.executable();
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final ReSvgBindings _bindings = ReSvgBindings(_dylib);

class _Identifiable {
  final int id;

  const _Identifiable(this.id);
}

class _RenderRequest extends _Identifiable {
  final int width;
  final int height;

  const _RenderRequest(super.id, this.width, this.height);
}

class _RenderResponse extends _Identifiable {
  final Pointer<Uint8>? pixels;
  final int length;
  final int width;
  final int height;

  const _RenderResponse(
      super.id, this.pixels, this.length, this.width, this.height);
}

class _SizeRequest extends _Identifiable {
  const _SizeRequest(super.id);
}

class _SizeResponse extends _Identifiable {
  final Size? size;

  const _SizeResponse(super.id, this.size);
}

class _CreateRequest {
  final String data;

  const _CreateRequest(this.data);
}

class _Shutdown {}
