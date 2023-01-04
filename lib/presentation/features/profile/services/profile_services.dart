import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tplatfom/presentation/features/auth/auth_main.dart';
import 'package:tplatfom/utils/utils.dart';

class ProfileServices {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const AuthMainPage(),
        ),
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}