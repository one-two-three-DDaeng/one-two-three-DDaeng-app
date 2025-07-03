import 'package:flutter/cupertino.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';

Border customBorder({
  Color color = CustomColor.lineColor,
  double width = 1,
}) =>
    Border.all(
      color: color,
      width: width,
    );
