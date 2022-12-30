import 'package:flutter/material.dart';

const String FONT_FAMILY = 'OpenSans';

TextTheme darkTextTheme = const TextTheme(
  //?  BODY 14 REG
  bodyText1: TextStyle(
    color: Colors.white,
    fontFamily: FONT_FAMILY,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  ),

  //? BODY 12 REG
  bodyText2: TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  ),

  //? HEADLINE 13 SEMI BOLD
  headline1: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: Colors.white,
    fontFamily: FONT_FAMILY,
  ),

  // ? BOLD 8
  headline2: TextStyle(
    fontSize: 8,
    color: Colors.white,
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  ),

  //?  SMALL BUTTONS 10 SEMI
  headline5: TextStyle(
    fontFamily: FONT_FAMILY,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 10,
  ),

  //?  CAPTION 11 REG
  caption: TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontFamily: FONT_FAMILY,
    fontSize: 11,
  ),
  //? BUTTON 10 SEMI
  button: TextStyle(
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  ),

  //?  TITLE SEMI BOLD 18
  subtitle1: TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: FONT_FAMILY,
    fontSize: 18,
    color: Colors.white,
  ),

  //?  SUBTITLE REG 18
  subtitle2: TextStyle(
    fontSize: 18,
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  ),
  
   //?  headline3 REG 14
  headline3: TextStyle(
    fontSize: 14,
    fontFamily: FONT_FAMILY,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  ),
);
