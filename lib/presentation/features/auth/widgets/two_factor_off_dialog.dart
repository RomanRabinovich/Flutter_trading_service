import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/chart/chart_screen.dart';

class TwoFactorOffDialog extends StatelessWidget {
  const TwoFactorOffDialog({
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
          const EdgeInsets.only(left: 12, right: 12, top: 32, bottom: 30),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(locale!.turnedOffTwoFactorTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 18,
              ),
              Text(locale.turnedOffTwoFactorContent,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkConfirmationDialogContent)),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 44,
                child: FloatingActionButton.extended(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  label: Text(
                    locale.ok,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<dynamic>(
                        builder: (_) => const ChartScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
