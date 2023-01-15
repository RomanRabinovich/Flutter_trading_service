import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tplatfom/presentation/common/resources/assets/app_fonts.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/common/ui/environment_banner/app_environment_banner.dart';
import 'package:tplatfom/presentation/features/auth/auth_main.dart';
import 'package:tplatfom/presentation/features/auth/service/auth_service.dart';
import 'package:tplatfom/presentation/features/main/main_screen.dart';
import 'package:tplatfom/providers/user_provider.dart';
import 'package:tplatfom/utils/global_variables.dart';

class TPlatformApp extends StatefulWidget {
  const TPlatformApp({super.key});

  @override
  State<TPlatformApp> createState() => _TPlatformAppState();
}

class _TPlatformAppState extends State<TPlatformApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

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
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: AppFontFamilies.defaultFamily,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: kPrimaryTextColor,
          fontFamily: 'Onest',
        ),
        iconTheme: const IconThemeData(color: kPrimaryTextColor),
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
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const MainScreen()
          : const AuthMainPage(),
      // SplashScreen(
      //   onSplashComplete: _openAuthMainPage,
      // ),
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
  void _brightenStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
