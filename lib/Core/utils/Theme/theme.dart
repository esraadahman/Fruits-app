import 'package:flutter/material.dart';
import 'package:fruits_app/Core/constants/colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.whiteColor,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(
      color: AppColors.button_Color,
    ),
  ),
);
