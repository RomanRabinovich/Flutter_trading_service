import 'package:flutter/material.dart';

class LocalMaterialButton extends StatelessWidget {
  const LocalMaterialButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.padding,
    this.height,
    this.width,
    this.splashColor,
    this.radius,
    Key? key,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? splashColor;
  final Widget child;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding,
      color: backgroundColor,
      elevation: 0,
      height: height,
      splashColor: splashColor ?? Colors.white,
      shape: generateShape(),
      onPressed: onPressed,
      child: child,
    );
  }

  ShapeBorder generateShape() {
    if (radius != null)
      return RoundedRectangleBorder(side: BorderSide(color: Color(0xff333643),width: 2),
          borderRadius: BorderRadius.circular(radius!));

    return StadiumBorder();
  }
}
