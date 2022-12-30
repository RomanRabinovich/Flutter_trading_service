import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tplatfom/_infra/environment/environment.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';

class AppEnvironmentBanner extends StatelessWidget {
  final Widget child;

  const AppEnvironmentBanner({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        child,
        if (Environment.current == Environment.staging) ...{
          _Banner(
            text: Environment.current.name.toUpperCase(),
            backgroundColor: AppColors.blueDark,
          ),
        }
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  static const double _boxSize = 100;
  static const double _offset = _boxSize / 3.5;

  final String text;
  final Color backgroundColor;

  const _Banner({
    required this.text,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: _boxSize,
          width: _boxSize,
          child: Center(
            child: Transform.translate(
              offset: const Offset(_offset, -_offset),
              child: Transform.rotate(
                angle: pi / 4,
                child: Container(
                  height: 15,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: backgroundColor.withOpacity(0.7),
                  padding: const EdgeInsets.fromLTRB(_offset, 1, _offset, 2),
                  child: _BannerText(text: text),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BannerText extends StatelessWidget {
  final String text;

  const _BannerText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
