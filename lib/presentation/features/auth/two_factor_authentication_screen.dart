import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/main/main_screen.dart';

class TwoFactorAuthenticationScreen extends StatelessWidget {
  const TwoFactorAuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkThemeBackground,
        title: Text(
          locale!.enableTwoFactorAuthTitle,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppColors.darkThemeBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  locale.enableTwoFactorAuthContent,
                  style: const TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  locale.enableTwoFactorAuthStepOne,
                  style: const TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  locale.enableTwoFactorAuthStepTwo,
                  style: const TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: size.height * 0.20,
                  child: Image.asset("assets/images/qrcode.png"),
                ),
                const SizedBox(height: 26),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    locale.secretKey,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.greyLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        locale.secretKeyContent.toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.copy,
                        color: AppColors.greyLight,
                        size: 28,
                      )
                    ],
                  ),
                ),
                Container(
                    color: AppColors.darkGrey,
                    height: 1,
                    width: MediaQuery.of(context).size.width),
                const SizedBox(height: 26),
                Text(
                  locale.enableTwoFactorAuthStepThree,
                  style: const TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FloatingActionButton.extended(
                        backgroundColor: AppColors.darkGrey,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        label: Text(
                          locale.later.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<dynamic>(
                              builder: (_) => const MainScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FloatingActionButton.extended(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        label: Text(
                          locale.enable.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute<dynamic>(
                          //     builder: (_) => const GetStartedScreen()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
