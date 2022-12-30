import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tplatfom/presentation/common/resources/assets/app_assets.dart';

class SplashScreen extends StatefulWidget {
  final void Function({required BuildContext context}) onSplashComplete;

  const SplashScreen({
    required this.onSplashComplete,
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _splashAnimationController;

  @override
  void initState() {
    _splashAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _splashAnimationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        widget.onSplashComplete(context: context);
      }
    });
    _splashAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _darkenStatusBar();
    return Lottie.asset(
      AppAssets.splash,
      controller: _splashAnimationController,
      fit: BoxFit.contain,
    );
  }

  void _darkenStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  void dispose() {
    _splashAnimationController.dispose();
    super.dispose();
  }
}
