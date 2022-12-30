
import 'package:flutter/material.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';

ButtonThemeData darkButtonTheme = ButtonThemeData(
  colorScheme: darkColorScheme,
  buttonColor: darkColorScheme.primary,
  hoverColor: darkColorScheme.primary.withOpacity(.8),
  splashColor: darkColorScheme.primary.withOpacity(.8),
  highlightColor: darkColorScheme.primary.withOpacity(.8),
  textTheme: ButtonTextTheme.accent,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(2),
  ),
);

FloatingActionButtonThemeData darkFloatingActionButtonThemeData =
    FloatingActionButtonThemeData(
  hoverColor: darkColorScheme.primary.withOpacity(.8),
  splashColor: darkColorScheme.primary.withOpacity(.8),
  focusColor: darkColorScheme.primary.withOpacity(.6),
  backgroundColor: darkColorScheme.primary,
  foregroundColor: Colors.white,
  // highlightElevation: 0,
  // elevation: 0,
  // focusElevation: 0,
  // hoverElevation: 0,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
);
