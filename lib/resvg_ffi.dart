import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:ffi/ffi.dart';

import 'resvg_bindings_generated.dart';

void renderSvg(String data, ImageDecoderCallback callback,
    {int? width, int? height, double dpr = 1}) {
  final str = data.toNativeUtf8();
  final options = _bindings.resvg_options_create();
  final tree = malloc<Pointer<resvg_render_tree>>();
  _bindings.resvg_parse_tree_from_data(str.cast(), str.length, options, tree);
  _bindings.resvg_options_destroy(options);

  final size = _bindings.resvg_get_image_size(tree.value);
  final transform = _bindings.resvg_transform_identity();

  double sx;
  double sy;
  if (width == null) {
    if (height == null) {
      sx = dpr;
      sy = dpr;
    } else {
      sy = height / size.height;
      sx = sy;
    }
  } else {
    sx = width / size.width;
    if (height == null) {
      sy = sx;
    } else {
      sy = height / size.height;
    }
  }

  transform.a = sx;
  transform.d = sy;
  final pixmapWidth = (size.width * sx).round();
  final pixmapHeight = (size.height * sy).round();
  final length = pixmapWidth * pixmapHeight * 4;
  final pixmap = malloc<Uint8>(length);
  _bindings.resvg_render(
      tree.value, transform, pixmapWidth, pixmapHeight, pixmap.cast());
  _bindings.resvg_tree_destroy(tree.value);

  final pixels = pixmap.asTypedList(length);
  decodeImageFromPixels(
      pixels, pixmapWidth, pixmapHeight, PixelFormat.rgba8888, callback);
}

const String _libName = 'resvg_ffi';

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
