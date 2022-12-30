import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/auth_main.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';

class LinkNotActiveScreen extends StatefulWidget {
  const LinkNotActiveScreen({Key? key}) : super(key: key);

  @override
  _LinkNotActiveScreenState createState() => _LinkNotActiveScreenState();
}

class _LinkNotActiveScreenState extends State<LinkNotActiveScreen> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkThemeBackground,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.24),
                SizedBox(
                  height: size.height * 0.14,
                  child: SvgPicture.asset(
                    "assets/images/logo/link_off_icon.svg",
                    semanticsLabel: '',
                    height: (context.isPortrait ? size.height : size.width) * 0.072,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    locale!.linkNotActiveTitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(locale.linkNotActiveContent, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.greyLight, fontWeight: FontWeight.w400, fontSize: 14),)),
                const SizedBox(height: 80),
                Container(
                  height: (context.isPortrait ? size.height : size.width) * 0.053,
                  margin: EdgeInsets.only(
                      top: 30, bottom: context.respWidgetH(0.049, 0.079)),
                  width: MediaQuery.of(context).size.width,
                  child: FloatingActionButton.extended(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      label: Text(
                        locale.signIn.toUpperCase(),
                        style: TextStyle(
                            fontSize: context.respText(16),
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: validateAndSaveForm),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validateAndSaveForm() async {
    await showDialog(
        barrierColor: darkBarrierColor,
        context: context,
        builder: (BuildContext context) {
          return const AuthMainPage();
        });
  }
}
