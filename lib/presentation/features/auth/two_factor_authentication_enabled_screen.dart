import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/lost_my_phone_screen.dart';
import 'package:tplatfom/presentation/features/main/main_screen.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';

class TwoFactorAuthenticationEnabledScreen extends StatefulWidget {
  const TwoFactorAuthenticationEnabledScreen({Key? key}) : super(key: key);

  @override
  _TwoFactorAuthenticationEnabledScreenState createState() => _TwoFactorAuthenticationEnabledScreenState();
}

class _TwoFactorAuthenticationEnabledScreenState extends State<TwoFactorAuthenticationEnabledScreen> {

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          backgroundColor: AppColors.darkThemeBackground,
        ),
        backgroundColor: AppColors.darkThemeBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                locale!.twoFactorAuthTitleEnabled,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              const SizedBox(height: 20),
              Text(
                locale.twoFactorAuthContentEnabled,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 4,
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      _otpTextField(context, true),
                      _otpTextField(context, false),
                      _otpTextField(context, false),
                      _otpTextField(context, false),
                      _otpTextField(context, false),
                      _otpTextField(context, false),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const LostMyPhoneScreen())),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: Text(
                      locale.twoFactorCannotUseAuthAppEnabled,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: context.respText(14),
                          fontWeight: FontWeight.w400,
                          color:
                          Theme.of(context).colorScheme.primaryContainer),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: (context.isPortrait ? size.height : size.width) * 0.053,
                margin: EdgeInsets.only(
                    top: 30, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: FloatingActionButton.extended(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    label: Text(
                      locale.submit.toUpperCase(),
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
    );
  }


  Widget _otpTextField(BuildContext context, bool autoFocus) {
    return Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: autoFocus,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 20, color: AppColors.white),
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }


  Future<void> validateAndSaveForm() async {
    await showDialog(
        barrierColor: darkBarrierColor,
        context: context,
        builder: (BuildContext context) {
          return const MainScreen();
        });
  }
}
