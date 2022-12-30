import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/recovery_link_screen.dart';
import 'package:tplatfom/presentation/features/auth/widgets/auth_form_field.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Text(
                locale!.forgotPasswordTitle,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              const SizedBox(height: 20),
              Text(
                locale.forgotPasswordContent,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const SizedBox(height: 36),
              AuthFormField(
                controller: emailController,
                title: locale.email,
                margin: const EdgeInsets.only(bottom: 10),
                // validators:
                //     Validators.compose([Validators.required, Validators.email]),
              ),
              const SizedBox(height: 26),
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
                      locale.forgotPasswordButton.toUpperCase(),
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

  Future<void> validateAndSaveForm() async {
    await showDialog(
        barrierColor: darkBarrierColor,
        context: context,
        builder: (BuildContext context) {
          return const RecoveryLinkScreen();
        });
  }
}
