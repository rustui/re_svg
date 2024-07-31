# re_svg

[![Pub](https://img.shields.io/pub/v/re_svg.svg)](https://pub.dev/packages/re_svg)

A tiny and super-fast SVG rendering library for Flutter.

## Getting Started
re_svg is designed for ease of use. By simply introducing the SvgView component, SVGs can be rendered correctly.
```dart
import 'package:re_svg/re_svg.dart';

// ...

SvgView(
  data: data, // string
  intrinsic: true,
)
```

## Screenshot

![Screenshot](screenshot.png)

## Supported Platforms
- [x] iOS
- [ ] Android
- [ ] macOS
- [ ] Windows
- [ ] Linux
- [ ] Web

## Related Projects
- [resvg_action](https://github.com/rustui/resvg_action) - Use GitHub Actions to compile the Rust library resvg for different platforms.
- [resvg_pod](https://github.com/rustui/resvg_pod) - For the iOS platform, Flutter’s local pod cannot directly download the online static library. Therefore, a new pod is created to download the resvg static library.

## For Rustaceans
This project demonstrates how to integrate Flutter with Rust libraries.