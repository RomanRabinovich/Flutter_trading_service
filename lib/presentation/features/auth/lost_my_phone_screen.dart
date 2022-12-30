import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/auth_main.dart';
import 'package:tplatfom/presentation/features/auth/send_request_screen.dart';
import 'package:tplatfom/presentation/features/auth/widgets/auth_form_field.dart';
import 'package:tplatfom/presentation/features/auth/widgets/two_factor_off_dialog.dart';
import 'package:tplatfom/presentation/features/chart/chart_screen.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';

class LostMyPhoneScreen extends StatefulWidget {
  const LostMyPhoneScreen({Key? key}) : super(key: key);

  @override
  _LostMyPhoneScreenState createState() => _LostMyPhoneScreenState();
}

class _LostMyPhoneScreenState extends State<LostMyPhoneScreen> {
  late TextEditingController rescueCodeController;

  @override
  void initState() {
    rescueCodeController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                locale!.lostMyPhoneTitle,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              const SizedBox(height: 20),
              Text(
                locale.lostMyPhoneContent,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const SizedBox(height: 30),
              AuthFormField(
                controller: rescueCodeController,
                title: locale.rescueCodeLostMyPhone,
                margin: const EdgeInsets.only(bottom: 10),
                // validators:
                //     Validators.compose([Validators.required, Validators.email]),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const SendRequestScreen())),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: Text(
                      locale.sendRequest,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: context.respText(14),
                          fontWeight: FontWeight.w400,
                          color:
                          Theme.of(context).colorScheme.primaryContainer),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 44,
                    child: FloatingActionButton.extended(
                      heroTag: 'btn1',
                      backgroundColor: AppColors.darkGrey,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      label: Text(
                        locale.cancel.toUpperCase(),
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
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 44,
                    child: FloatingActionButton.extended(
                        heroTag: 'btn2',
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      label: Text(
                        locale.submitCode.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      onPressed: validateAndSaveForm
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

  Future<void> validateAndSaveForm() async {
    await showDialog(
        barrierColor: darkBarrierColor,
        context: context,
        builder: (BuildContext context) {
          return const TwoFactorOffDialog();
        });
  }
}

