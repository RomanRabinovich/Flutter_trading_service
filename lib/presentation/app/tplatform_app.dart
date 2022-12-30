import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tplatfom/presentation/common/resources/assets/app_fonts.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/common/ui/environment_banner/app_environment_banner.dart';
import 'package:tplatfom/presentation/features/auth/auth_main.dart';
import 'package:tplatfom/presentation/features/splash/splash_screen.dart';

class TPlatformApp extends StatelessWidget {
  const TPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'TPlatform',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        // Locale('uk', ''),
      ],
      theme: ThemeData(
        fontFamily: AppFontFamilies.defaultFamily,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.greyBackground,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.greyLight,
        ),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return AppEnvironmentBanner(child: widget ?? const SizedBox());
      },
     home: SplashScreen(onSplashComplete: _openAuthMainPage),
    );
  }

  void _openAuthMainPage({required BuildContext context}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const AuthMainPage(),
      ),
    );
    _brightenStatusBar();
  }

  //
  // void _openMainScreen({required BuildContext context}) {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (_) => const MainScreen(),
  //     ),
  //   );
  //   _brightenStatusBar();
  // }
  //
  void _brightenStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}

// home: ref.watch(userDataAuthProvider).when(
// data: (user) {
// if (user == null) {
// return const LandingScreen();
// }
// return const MobileLayoutScreen();
// },
// error: (err, trace) {
// return ErrorScreen(
// error: err.toString(),
// );
// },
// loading: () => const Loader(),
// ),