import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tplatfom/controllers/providers/login_controller_provider.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/presentation/features/auth/forgot_password_screen.dart';
import 'package:tplatfom/presentation/features/auth/widgets/auth_form_field.dart';
import 'package:tplatfom/presentation/features/auth/widgets/social_button.dart';
import 'package:tplatfom/presentation/features/chart/chart_screen.dart';
import 'package:tplatfom/repository/auth_repository.dart';
import 'package:tplatfom/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tplatfom/utils/validators.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({
    Key? key,
    this.prefs,
  }) : super(key: key);

  final SharedPreferences? prefs;

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AppLocalizations locale;
  bool isPasswordObscured = true;
  bool isRememberMe = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;
    // final Size size = MediaQuery.of(context).size;
    // final isPortrait =
    //     MediaQuery.of(context).orientation == Orientation.portrait;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              AuthFormField(
                  controller: emailController,
                  title: locale.email,
                  margin: const EdgeInsets.only(bottom: 10),
                  validators: EmailValidator.email),
              AuthFormField(
                margin: const EdgeInsets.only(bottom: 5),
                controller: passwordController,
                title: locale.password,
                isObscure: isPasswordObscured,
                validators: PasswordValidator.password,
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    // Icons.visibility_off_sharp,
                    color: AppColors.greyLight,
                    isPasswordObscured
                        ? Icons.visibility_off_sharp
                        : Icons.visibility,
                    // color: Theme.of(context).colorScheme.onSurface,
                    size: context.respWidgetH(0.019),
                  ),
                  onPressed: togglePasswordObscure,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ForgotPasswordScreen())),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: Text(
                      locale.forgotPassword,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: context.respText(14),
                          fontWeight: FontWeight.w400,
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                    ),
                  ),
                ),
              ),
              CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Theme.of(context).colorScheme.primaryContainer,
                side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(width: 1.0, color: Colors.white),
                ),
                title: Text(
                  locale.rememberMe,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: context.respText(16),
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                contentPadding: EdgeInsets.zero,
                value: isRememberMe,
                onChanged: (newValue) {
                  setState(() {
                    isRememberMe = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Container(
                height: context.respWidgetH(0.056),
                margin: EdgeInsets.only(
                    top: 30, bottom: context.respWidgetH(0.049, 0.079)),
                width: double.infinity,
                child: FloatingActionButton.extended(
                  shape: BeveledRectangleBorder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleRememberMe() => setState(() => isRememberMe = !isRememberMe);

  void togglePasswordObscure() =>
      setState(() => isPasswordObscured = !isPasswordObscured);

  validateAndSaveForm() async {

    final FormState? state = formKey.currentState;
    if (state!.validate()) {
        ref
            .read(loginControllerProvider.notifier)
            .login(emailController.text, passwordController.text);
      }
  }
}
