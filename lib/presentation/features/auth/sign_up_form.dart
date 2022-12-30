import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/widgets/auth_form_field.dart';
import 'package:tplatfom/presentation/features/auth/widgets/confirmation_dialog.dart';
import 'package:tplatfom/presentation/features/auth/widgets/social_button.dart';
import 'package:tplatfom/themes/dark/dark_color_scheme.dart';
import 'package:tplatfom/utils/extensions.dart';
import 'package:tplatfom/utils/validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
  bool isAgreement = false;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              AuthFormField(
                  margin: const EdgeInsets.only(bottom: 10),
                  title: locale!.firstName,
                  controller: firstNameController,
                  validators: RequiredValidator.required),
              AuthFormField(
                  margin: const EdgeInsets.only(bottom: 10),
                  title: locale!.lastName,
                  controller: lastNameController,
                  validators: RequiredValidator.required),
              AuthFormField(
                  margin: const EdgeInsets.only(bottom: 10),
                  title: locale.email,
                  controller: emailController,
                  validators: EmailValidator.email),
              AuthFormField(
                margin: const EdgeInsets.only(bottom: 10),
                isObscure: isPasswordObscured,
                title: locale.password,
                controller: passwordController,
                validators: PasswordValidator.password,
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    color: AppColors.greyLight,
                    isPasswordObscured
                        ? Icons.visibility_off_sharp
                        : Icons.visibility,
                    size: context.respWidgetH(0.019),
                  ),
                  onPressed: () =>
                      setState(() => isPasswordObscured = !isPasswordObscured),
                ),
              ),
              //  if (!isPasswordObscured && isConfirmPasswordObscured)
              //  ValidatedPassword(passwordController),
              AuthFormField(
                margin: const EdgeInsets.only(bottom: 5),
                title: locale.passwordConfirm,
                controller: confirmPasswordController,
                isObscure: isConfirmPasswordObscured,
                validators: PasswordValidator.password,
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    color: AppColors.greyLight,
                    isConfirmPasswordObscured
                        ? Icons.visibility_off_sharp
                        : Icons.visibility,
                    size: context.respWidgetH(0.019),
                  ),
                  onPressed: () => setState(() =>
                      isConfirmPasswordObscured = !isConfirmPasswordObscured),
                ),
              ),
              Container(
                height: context.respWidgetH(0.056),
                margin: EdgeInsets.only(
                    top: 30, bottom: context.respWidgetH(0.049, 0.079)),
                width: double.infinity,
                child: FloatingActionButton.extended(
                  shape:  BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                  ),
                  label: Text(
                    locale.signIn.toUpperCase(),
                    style: TextStyle(
                        fontSize: context.respText(16),
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: validateAndSaveForm,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        path: "assets/images/social/google_logo.svg",
                      ),
                      const VerticalDivider(
                        color: AppColors.darkGrey,
                        width: 60,
                        thickness: 1,
                      ),
                      SocialButton(
                        path: "assets/images/social/facebook_logo.svg",
                      ),
                      const VerticalDivider(
                        color: AppColors.darkGrey,
                        width: 60,
                        thickness: 1,
                      ),
                      SocialButton(
                        path: "assets/images/social/apple_logo.svg",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void initializeControllers() {
    firstNameController = TextEditingController(text: "");
    lastNameController = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    confirmPasswordController = TextEditingController(text: "");
  }

  validateAndSaveForm() async {
     final FormState? state = formKey.currentState;
    if (state!.validate()) {
    /*     print('ss');
      Navigator.of(context)
          .push(MaterialPageRoute<dynamic>(builder: (_) => ChartPage())); */
    await showDialog(
        barrierColor: darkBarrierColor,
        context: context,
        builder: (BuildContext context) {
          return const ConfirmationDialog();
        });
  }

// void _showSnackBar(BuildContext context, String message) {
//   final snackBar = SnackBar(content: Text(message));
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
}
