import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/auth_main.dart';
import 'package:tplatfom/utils/extensions.dart';

class SendRequestDialog extends StatelessWidget {
  const SendRequestDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          backgroundColor: AppColors.darkConfirmationDialogBackground,
          insetPadding: const EdgeInsets.only(right: 12, left: 12),
          contentPadding:
              const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 40),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height * 0.1,
                child: SvgPicture.asset(
                  "assets/images/logo/vector_icon.svg",
                  semanticsLabel: '',
                  height:
                      (context.isPortrait ? size.height : size.width) * 0.042,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(locale!.requestSent,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 40),
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
                        builder: (_) => const AuthMainPage()));
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
