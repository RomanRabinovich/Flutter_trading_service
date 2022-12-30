import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/new_password_updated_screen.dart';
import 'package:tplatfom/presentation/features/auth/recovery_link_screen.dart';
import 'package:tplatfom/presentation/features/auth/widgets/auth_form_field.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';
import 'package:tplatfom/utils/validators_password_check.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    passwordController = TextEditingController(text: "");
    confirmPasswordController = TextEditingController(text: "");
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
                locale!.resetPasswordTitle,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              const SizedBox(height: 20),
              Text(
                locale.resetPasswordContent,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const SizedBox(height: 36),
              AuthFormField(
                margin: const EdgeInsets.only(bottom: 10),
                isObscure: isPasswordObscured,
                title: locale.password,
                controller: passwordController,
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    color: AppColors.greyLight,
                    isPasswordObscured
                        ? Icons.visibility_off_sharp
                        : Icons.visibility,
                    // color: Theme.of(context).colorScheme.onSecondary,
                    size: context.respWidgetH(0.019),
                  ),
                  onPressed: () =>
                      setState(() => isPasswordObscured = !isPasswordObscured),
                ),
                // validators: Validators.compose(
                //     [Validators.required, Validators.password]),
              ),
              if (!isPasswordObscured && isConfirmPasswordObscured) ValidatedPassword(passwordController),
              AuthFormField(
                margin: const EdgeInsets.only(bottom: 5),
                title: locale.passwordConfirm,
                controller: confirmPasswordController,
                isObscure: isConfirmPasswordObscured,
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    color: AppColors.greyLight,
                    isConfirmPasswordObscured
                        ? Icons.visibility_off_sharp
                        : Icons.visibility,
                    // color: Theme.of(context).colorScheme.onSecondary,
                    size: context.respWidgetH(0.019),
                  ),
                  onPressed: () => setState(() =>
                  isConfirmPasswordObscured = !isConfirmPasswordObscured),
                ),
                // validators: Validators.compose(
                //     [Validators.required, Validators.password]),
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
                      locale.resetPasswordButton.toUpperCase(),
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
          return const NewPasswordUpdatedScreen();
        });
  }
}
