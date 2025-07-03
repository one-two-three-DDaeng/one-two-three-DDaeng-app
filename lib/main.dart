import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/home/home_view.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: customTheme(context),
        home: const HomeView(),
      ),
    );
  }
}
