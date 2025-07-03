import 'package:flutter/material.dart';

import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';

ThemeData customTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'NotoSans',
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColor.mainColor,
      centerTitle: true,
      toolbarHeight: 56,
      iconTheme: IconThemeData(
        color: CustomColor.blackColor,
        size: 26,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColor.mainColor,
        padding: const EdgeInsets.only(
          left: 6,
          right: 6,
        ),
        textStyle: customTextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.black,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: const Size.fromHeight(40),
        padding: EdgeInsets.zero,
        side: const BorderSide(
          width: 1,
          color: CustomColor.mainColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColor.mainColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: CustomColor.lineColor,
  );
}
