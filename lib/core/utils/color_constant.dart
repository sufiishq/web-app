import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray400 = fromHex('#c4c6d0');

  static Color black900 = fromHex('#000000');

  static Color gray900 = fromHex('#001b3e');

  static Color lightBlueA700 = fromHex('#007aff');

  static Color blueGray900 = fromHex('#303030');

  static Color gray6001e = fromHex('#1e767680');

  static Color gray80099 = fromHex('#993c3c43');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray100 = fromHex('#f2f2f7');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
