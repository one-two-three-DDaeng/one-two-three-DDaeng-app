import 'package:flutter/material.dart';

import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';

TextStyle customTextStyle({
  Color color = CustomColor.blackColor,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  double? height,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontFamily: 'NotoSans',
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decoration: decoration,
  );
}
