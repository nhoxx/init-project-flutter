import 'package:flutter/material.dart';
import 'package:pets_analytics/common/AppColors.dart';
import 'package:pets_analytics/common/AppStyles.dart';

class PetsButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? color;

  const PetsButton(
      {super.key,
      this.onPressed,
      required this.title,
      this.backgroundColor,
      this.color});
  @override
  Widget build(Object context) {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 51),
            backgroundColor: AppColors.appColors,
            foregroundColor: AppColors.greyLight,
            padding: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            )),
        onPressed: onPressed,
        child: Text(
          title,
          style: getAppTextStyle(AppStyles.whiteBoldS18, 24)
              .copyWith(color: color),
        ));
  }
}
