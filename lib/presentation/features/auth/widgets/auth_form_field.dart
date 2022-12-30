import 'package:flutter/material.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';
import 'package:tplatfom/utils/extensions.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    required this.title,
    required this.controller,
    this.onChanged,
    this.validators,
    this.margin,
    this.suffix,
    this.isObscure = false,
    this.type,
    Key? key,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validators;
  final EdgeInsets? margin;
  final Widget? suffix;
  final bool? isObscure;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.hintGrey,
      height: context.respWidgetH(.060, .058),
      margin: margin ?? EdgeInsets.all(0),
      child: TextFormField(
        obscureText: isObscure!,
        style: TextStyle(fontSize: context.respText(16), color: Colors.white),
        controller: controller,
       validator: validators,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 10, vertical: context.respWidgetH(0.02)),
          hintText: title,
          isDense: true,
          /*    labelText: title, */
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: Colors.transparent,
            ),
          ),
          hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: context.respText(16), fontWeight: FontWeight.w400, color: AppColors.greyLight),
          labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: context.respText(16), fontWeight: FontWeight.w400),
          suffixIcon: FittedBox(
            child: suffix,
          ),
        ),
      ),
    );
  }
}
