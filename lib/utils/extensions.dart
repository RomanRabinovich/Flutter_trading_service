import 'package:flutter/material.dart';

class Breakpoint {
  static const double sm = 500; // Small Mobile
  static const double md = 600; // Tablet
  static const double lg = 990; // Desktop
  static const double xl = 1240; // Large-desktop
  static const double xxl = 1440; // Extra extra larges
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension ContextEx on BuildContext {
  bool get isMobile => this.width <= Breakpoint.md;

  bool get isTablet =>
      this.width < Breakpoint.lg && this.width >= Breakpoint.md;

  bool get isTabletOrLarger => this.width >= Breakpoint.md;

  bool get isDesktop => this.width >= Breakpoint.lg;

  //Orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 100;
}

extension ContextSize on BuildContext {
  // responsive height (movile or tablet)
  double respWidgetH(movile, [tablet]) => tablet != null
      ? (this.isTablet ? respH * tablet : respH * movile)
      : respH * movile;

  double respText(num refSize, [num? tablet]) {
    num refSizeTemp=this.isTablet &&tablet != null?tablet:refSize;
    double unitHeightValue = respH * 0.001;
    double multiplier = 1.30;
    double value = (refSizeTemp * unitHeightValue) * multiplier;
    if((refSizeTemp-value)>1.5)
      value=refSizeTemp-1.5;
    print(refSizeTemp.toString()+' '+value.toString());
    return value >= 11 ? value : 11;
  }

  double get respH => (this.isPortrait ? this.height : this.width);

  double get respW => (this.isPortrait ? this.width : this.height);
}