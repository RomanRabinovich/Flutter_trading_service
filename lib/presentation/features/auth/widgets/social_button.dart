import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tplatfom/presentation/features/auth/get_started_screen_for_socials.dart';
import 'package:tplatfom/utils/extensions.dart';

class SocialButton extends StatelessWidget {
  SocialButton({required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<dynamic>(builder: (_) => GetStartedScreenForSocials()));
      },
      child: SizedBox(
        child: Container(
          child: SvgPicture.asset(
            path,
            height: context.respWidgetH(0.045, 0.039),
            semanticsLabel: '',
          ),
        ),
      ),
    );
  }
}
