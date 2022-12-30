import 'package:flutter/material.dart';
import 'package:tplatfom/presentation/common/resources/colors/app_colors.dart';

class AppBottomSheetDragAnchor extends StatelessWidget {
  static const EdgeInsets margin = EdgeInsets.only(top: 8, bottom: 10);
  static const double _height = 5;

  static double get boxHeight => _height + margin.vertical;

  const AppBottomSheetDragAnchor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width / 10,
        height: _height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          color: AppColors.greyLight.withOpacity(0.2),
        ),
      ),
    );
  }
}
