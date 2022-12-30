
import 'package:flutter/material.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/themes/dark/dark_text_theme.dart';

TabBarTheme darkTabBarTheme = TabBarTheme(
  labelColor: darkColorScheme.primary,
  unselectedLabelColor: darkColorScheme.onSecondary,
  unselectedLabelStyle: darkTextTheme.bodyText2,
  labelStyle: darkTextTheme.headline2,
  labelPadding: EdgeInsets.all(0),
  indicatorSize: TabBarIndicatorSize.tab,
  indicator: ShapeDecoration(
    shape: UnderlineInputBorder(
      borderSide: BorderSide(
        color: darkColorScheme.primary,
        width: 2,
        style: BorderStyle.solid,
      ),
    ),
  ),
);
