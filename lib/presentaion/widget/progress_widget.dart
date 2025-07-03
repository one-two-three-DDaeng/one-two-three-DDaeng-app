import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';

Widget progressWidget([Color color = CustomColor.mainColor]) {
  return Center(
    child: CircularProgressIndicator(
      color: color,
    ),
  );
}
