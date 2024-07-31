import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:re_svg/resvg_ffi.dart';

class SvgView extends StatefulWidget {
  final String data;
  final bool intrinsic;

  const SvgView({super.key, required this.data, this.intrinsic = false});
  @override
  State<SvgView> createState() => _SvgViewState();
}

class _SvgViewState extends State<SvgView> {
  ui.Image? _image;
  ReSvg? _reSvg;
  int? _lastWidth;
  int? _lastHeight;

  @override
  void dispose() {
    final reSvg = _reSvg;
    if (reSvg != null) {
      reSvg.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
      final reSvg = _reSvg;
      if (reSvg == null) {
        ReSvg.from(widget.data).then((reSvg) {
          _reSvg = reSvg;
          final (width, height) =
              _getPhysicalSize(reSvg.size, constraints, devicePixelRatio);
          _lastWidth = width;
          _lastHeight = height;
          return reSvg.render(width, height);
        }).then(_imageCallback);
      } else {
        final (width, height) =
            _getPhysicalSize(reSvg.size, constraints, devicePixelRatio);
        if (width != _lastWidth || height != _lastHeight) {
          _lastWidth = width;
          _lastHeight = height;
          reSvg.render(width, height).then(_imageCallback);
        }
      }

      return RawImage(
        image: _image,
        scale: devicePixelRatio,
      );
    });
  }

  void _imageCallback(ui.Image result) {
    setState(() {
      _image = result;
    });
  }

  (int, int) _getPhysicalSize(
      Size size, BoxConstraints constraints, double devicePixelRatio) {
    final ratio = size.width / size.height;
    double logicalWidth, logicalHeight;

    if (constraints.maxWidth == double.infinity) {
      if (constraints.maxHeight == double.infinity) {
        logicalWidth = size.width;
        logicalHeight = size.height;
      } else {
        if (widget.intrinsic) {
          if (size.height > constraints.maxHeight) {
            logicalHeight = constraints.maxHeight;
            logicalWidth = logicalHeight * ratio;
          } else {
            logicalHeight = size.height;
            logicalWidth = size.width;
          }
        } else {
          logicalHeight = constraints.maxHeight;
          logicalWidth = logicalHeight * ratio;
        }
      }
    } else if (constraints.maxHeight == double.infinity) {
      if (widget.intrinsic) {
        if (size.width > constraints.maxWidth) {
          logicalWidth = constraints.maxWidth;
          logicalHeight = logicalWidth / ratio;
        } else {
          logicalWidth = size.width;
          logicalHeight = size.height;
        }
      } else {
        logicalWidth = constraints.maxWidth;
        logicalHeight = logicalWidth / ratio;
      }
    } else {
      final boxRatio = constraints.maxWidth / constraints.maxHeight;
      if (ratio > boxRatio) {
        if (widget.intrinsic) {
          if (size.width > constraints.maxWidth) {
            logicalWidth = constraints.maxWidth;
            logicalHeight = logicalWidth / ratio;
          } else {
            logicalWidth = size.width;
            logicalHeight = size.height;
          }
        } else {
          logicalWidth = constraints.maxWidth;
          logicalHeight = logicalWidth / ratio;
        }
      } else {
        if (widget.intrinsic) {
          if (size.height > constraints.maxHeight) {
            logicalHeight = constraints.maxHeight;
            logicalWidth = logicalHeight * ratio;
          } else {
            logicalHeight = size.height;
            logicalWidth = size.width;
          }
        } else {
          logicalHeight = constraints.maxHeight;
          logicalWidth = logicalHeight * ratio;
        }
      }
    }

    final physicalWidth = logicalWidth * devicePixelRatio;
    final physicalHeight = logicalHeight * devicePixelRatio;
    return (physicalWidth.round(), physicalHeight.round());
  }
}
