import 'package:flutter/material.dart';
import 'package:tplatfom/themes/dark/app_bar_theme.dart';
import 'package:tplatfom/themes/dark/button_theme.dart';
import 'package:tplatfom/themes/dark/card_theme.dart';
import 'package:tplatfom/themes/dark/checkbox_theme.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/themes/dark/dark_text_theme.dart';
import 'package:tplatfom/themes/dark/dialog_theme.dart';
import 'package:tplatfom/themes/dark/divider_theme_data.dart';
import 'package:tplatfom/themes/dark/icon_theme.dart';
import 'package:tplatfom/themes/dark/input_decoration_theme.dart';
import 'package:tplatfom/themes/dark/text_selections_theme.dart';

ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    appBarTheme: darkAppBarTheme,
    textTheme: darkTextTheme,
    cardTheme: darkCardTheme,
    buttonTheme: darkButtonTheme,
    floatingActionButtonTheme: darkFloatingActionButtonThemeData,
    buttonColor: darkColorScheme.primaryVariant,
    fontFamily: FONT_FAMILY,
    cardColor: darkColorScheme.secondaryVariant,
    iconTheme: darkIconTheme,
    hintColor: darkColorScheme.background,
    textSelectionTheme: darkSelectionTheme,
    backgroundColor: darkColorScheme.onBackground,
    scaffoldBackgroundColor: darkColorScheme.onBackground,
    inputDecorationTheme: darkInputDecorationTheme,
    unselectedWidgetColor: Color(0xFF51525B),
    checkboxTheme: darkcheckboxThemeData,
    dialogTheme: darkDialogTheme,
    dividerTheme: darkDividerThemeData);
