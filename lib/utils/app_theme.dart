import 'package:flutter/material.dart';
import 'package:islami/utils/app_text_style.dart';

class AppTheme {
  static ThemeData darkTheme=ThemeData(
    textTheme: TextTheme(
      headlineLarge: AppTextStyle.bold16white
    )
  );
  static ThemeData lightTheme=ThemeData(
      textTheme: TextTheme(
          headlineLarge: AppTextStyle.bold16white
      )
  );

}