// Place fonts/font-app.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: font-app
//      fonts:
//       - asset: fonts/font-app.ttf
import 'package:flutter/widgets.dart';

class IconApp {
  IconApp._();

  static const String _fontFamily = 'font-app';

  static const IconData notification = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData bookmark = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData like = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData cartIcon = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData editIcon = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData lockIcon = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData paymentIcon = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData receiptIcon = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData star2 = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData plus = IconData(0xea0a, fontFamily: _fontFamily);
  static const IconData minus = IconData(0xea0b, fontFamily: _fontFamily);
  static const IconData arrowRight2 = IconData(0xea3c, fontFamily: _fontFamily);
  static const IconData arrowLeft2 = IconData(0xea40, fontFamily: _fontFamily);
}
