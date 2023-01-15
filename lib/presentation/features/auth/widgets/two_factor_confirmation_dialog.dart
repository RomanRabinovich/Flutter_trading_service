import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/auth_main.dart';
import 'package:tplatfom/presentation/features/auth/two_factor_authentication_screen.dart';

class TwoFactorConfirmationDialog extends StatelessWidget {
  const TwoFactorConfirmationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          backgroundColor: AppColors.darkConfirmationDialogBackground,
          insetPadding: const EdgeInsets.only(right: 12, left: 12),
          contentPadding:
              const EdgeInsets.only(left: 12, right: 12, top: 50, bottom: 40),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(locale!.twoFactorRegistrationTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 23,
              ),
              Text(locale.twoFactorRegistrationContentFirst,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkConfirmationDialogContent)),
              const SizedBox(
                height: 15,
              ),
              Text(locale.twoFactorRegistrationContentSecond,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkConfirmationDialogContent)),
              const SizedBox(
                height: 50,
              ),
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
                            builder: (_) => const AuthMainPage(),
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
                        Navigator.of(context).push(MaterialPageRoute<dynamic>(
                            builder: (_) => const TwoFactorAuthenticationScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
