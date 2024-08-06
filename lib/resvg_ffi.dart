import 'dart:async';
import 'dart:ffi' hide Size;
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui';

import 'package:ffi/ffi.dart';

import 'resvg_bindings_generated.dart';

class ReSvg {
  final Pointer<Pointer<resvg_render_tree>> _tree;
  late final Size size;
  var shouldClean = false;
  var _hasCleaned = false;

  ReSvg._(this._tree, this.size);

  static Future<ReSvg> from(String data) async =>
      await Isolate.run(() => _from(data));

  Future<Image?> render(int width, int height) async {
    if (_hasCleaned) {
      return null;
    }
    final (pixmap, pixels) = await Isolate.run(() => _render(width, height));
    final completer = Completer<Image>();
    decodeImageFromPixels(pixels, width, height, PixelFormat.rgba8888, (image) {
      malloc.free(pixmap);
      if (shouldClean && !_hasCleaned) {
        _hasCleaned = true;
        _dispose();
      }
      completer.complete(image);
    });
    return completer.future;
  }

  static ReSvg _from(String data) {
    final str = data.toNativeUtf8();
    final options = _bindings.resvg_options_create();
    final tree = malloc<Pointer<resvg_render_tree>>();
    _bindings.resvg_parse_tree_from_data(str.cast(), str.length, options, tree);
    _bindings.resvg_options_destroy(options);

    final rawSize = _bindings.resvg_get_image_size(tree.value);
    final size = Size(rawSize.width, rawSize.height);
    return ReSvg._(tree, size);
  }

  (Pointer<Uint8>, Uint8List) _render(int width, int height) {
    final transform = _bindings.resvg_transform_identity();

    transform.a = width / size.width;
    transform.d = height / size.height;
    final length = width * height * 4;
    final pixmap = malloc<Uint8>(length);
    _bindings.resvg_render(
        _tree.value, transform, width, height, pixmap.cast());

    return (pixmap, pixmap.asTypedList(length));
  }

  void _dispose() {
    _bindings.resvg_tree_destroy(_tree.value);
    malloc.free(_tree);
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
