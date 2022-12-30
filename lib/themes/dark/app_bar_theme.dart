
import 'package:flutter/material.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/themes/dark/dark_text_theme.dart';

AppBarTheme darkAppBarTheme = AppBarTheme(
  color: darkColorScheme.primaryVariant,
  elevation: 0.0,
  textTheme: darkTextTheme,
  iconTheme: IconThemeData(color: Colors.white.withOpacity(0.8), size: 20),
);
