import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tplatfom/controllers/providers/router_provider.dart';
import 'package:tplatfom/presentation/common/resources/assets/app_fonts.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/common/ui/environment_banner/app_environment_banner.dart';

class TPlatformApp extends ConsumerWidget {
  const TPlatformApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
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
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return AppEnvironmentBanner(child: widget ?? const SizedBox());
      },
     // home: SplashScreen(onSplashComplete: _openAuthMainPage),
    );
  }
  //
  // void _openAuthMainPage({required BuildContext context}) {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (_) => const AuthMainPage(),
  //     ),
  //   );
  //   _brightenStatusBar();
  // }

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
  // void _brightenStatusBar() {
  //   SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //       statusBarIconBrightness: Brightness.light,
  //     ),
  //   );
  // }
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