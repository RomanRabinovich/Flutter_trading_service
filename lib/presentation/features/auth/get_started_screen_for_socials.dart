import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/widgets/auth_form_field.dart';
import 'package:tplatfom/presentation/features/auth/widgets/two_factor_confirmation_dialog.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';

class GetStartedScreenForSocials extends StatefulWidget {
  const GetStartedScreenForSocials({Key? key}) : super(key: key);

  @override
  _GetStartedScreenForSocialsState createState() => _GetStartedScreenForSocialsState();
}

class _GetStartedScreenForSocialsState extends State<GetStartedScreenForSocials> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: AppColors.darkThemeBackground,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                SizedBox(
                  height: size.height * 0.14,
                  child: SvgPicture.asset(
                    "assets/images/logo/get_started_icon.svg",
                    semanticsLabel: '',
                    height: (context.isPortrait ? size.height : size.width) * 0.072,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 6),
                Text(locale!.getStartedScreenContent, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                const SizedBox(height: 8),
                Text(locale.enterPersonalData, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.greyLight, fontWeight: FontWeight.w400, fontSize: 16),),
                const SizedBox(height: 30),
                AuthFormField(
                  margin: const EdgeInsets.only(bottom: 10),
                  title: locale.firstName,
                  controller: firstNameController,
                ),
                AuthFormField(
                  margin: const EdgeInsets.only(bottom: 10),
                  title: locale.lastName,
                  controller: lastNameController,
                ),
                const SizedBox(height: 20),
                Container(
                  height: (context.isPortrait ? size.height : size.width) * 0.053,
                  margin: EdgeInsets.only(
                      top: 30, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  child: FloatingActionButton.extended(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      label: Text(
                        locale.getStarted.toUpperCase(),
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


  void initializeControllers() {
    firstNameController = TextEditingController(text: "");
    lastNameController = TextEditingController(text: "");
  }

  Future<void> validateAndSaveForm() async {
    await showDialog(
        barrierColor: darkBarrierColor,
        context: context,
        builder: (BuildContext context) {
          return const TwoFactorConfirmationDialog();
        });
  }
}
