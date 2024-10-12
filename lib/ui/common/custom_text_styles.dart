import 'package:animation_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle bodyStyle({
    double size = 14,
    Color color = Appcolor.primaryShade,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
        // height: 1,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.none);
  }
}
