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
  ui.Image? image;
  int? lastWidth;
  int? lastHeight;
  bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      final dpr = MediaQuery.of(context).devicePixelRatio;
      int? width;
      int? height;
      if (!widget.intrinsic) {
        width = constraints.maxWidth == double.infinity
            ? null
            : (constraints.maxWidth * dpr).round();
        height = constraints.maxHeight == double.infinity
            ? null
            : (constraints.maxHeight * dpr).round();
      }
      if (!isExecuted || width != lastWidth || height != lastHeight) {
        renderSvg(widget.data, width: width, height: height, dpr: dpr,
            (result) {
          setState(() {
            image = result;
            lastWidth = width;
            lastHeight = height;
            isExecuted = true;
          });
        });
      }

      return RawImage(
        image: image,
        scale: dpr,
      );
    });
  }
}
