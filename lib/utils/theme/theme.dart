import 'package:flutter/material.dart';
import 'package:music_app/utils/constants/colors.dart';
import 'package:music_app/utils/theme/customs/check_box.dart';
import 'package:music_app/utils/theme/customs/elevated_button_theme.dart';
import 'package:music_app/utils/theme/customs/outline_button_theme.dart';

import 'customs/text_field_theme.dart';

class TaiyoTheme {
  TaiyoTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue,
    scaffoldBackgroundColor: TaiyoColors.white,
    checkboxTheme: TaiyoCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: TaiyoElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TaiyoOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TaiyoTextFormFieldTheme.lightInputDecorationTheme,
  );
  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.lightBlue,
    scaffoldBackgroundColor: TaiyoColors.dark,
    checkboxTheme: TaiyoCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: TaiyoElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TaiyoOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TaiyoTextFormFieldTheme.darkInputDecorationTheme,
  );
}
