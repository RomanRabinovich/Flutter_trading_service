import 'package:flutter/material.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';

class PasswordCheck {
  const PasswordCheck(this.title, this.error, this.checker);
  final String title;
  final String error;
  final bool Function(String password) checker;
}

class ValidatedPassword extends StatefulWidget {
  const ValidatedPassword(this.passwordController, {super.key});

  final TextEditingController passwordController;

  @override
  ValidatedPasswordState createState() => ValidatedPasswordState();
}

class ValidatedPasswordState extends State<ValidatedPassword> {
  ValidatedPasswordState();

  @override
  void initState() {
    super.initState();

    widget.passwordController.addListener(setStateSafe);
  }

  void setStateSafe() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();

    widget.passwordController.removeListener(setStateSafe);
  }

  static List<PasswordCheck> checks = [
    PasswordCheck(
      'Includes a lowercase letter',
      'Password must include a lowercase letter',
          (password) => password.contains(RegExp(r'[a-z]')),
    ),
    PasswordCheck(
      'At least 8 characters',
      'Password must be at least 8 characters',
          (password) => password.length >= 8,
    ),
    PasswordCheck(
      'Includes a digit',
      'Password must include a digit',
          (password) => password.contains(RegExp(r'[0-9]')),
    ),
    PasswordCheck(
      'Includes a symbol',
      'Password must include a symbol',
          (password) => password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
    ),
    PasswordCheck(
      'Includes an uppercase letter',
      'Password must include an uppercase letter',
          (password) => password.contains(RegExp(r'[A-Z]')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var check in checks)
          if (check.checker(widget.passwordController.text))
            ListTile(
              leading: const Icon(Icons.check, color: Colors.white,),
              dense: true,
              visualDensity: VisualDensity(vertical: -2), // to compact
              title: Text(check.title, style: const TextStyle(
                  color: Colors.white),),
            )
          else
            ListTile(
              leading: const Icon(Icons.close, color: AppColors.darkGrey,),
              dense: true,
              visualDensity: VisualDensity(vertical: -2), // to compact
              title: Text(check.title, style: const TextStyle(
                  color: AppColors.darkGrey),),
            ),
      ],
    );
  }
}