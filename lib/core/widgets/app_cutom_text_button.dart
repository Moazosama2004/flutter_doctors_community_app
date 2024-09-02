import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/helpers/extensions.dart';
import 'package:flutter_doctors_community_app/core/routing/routes.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textStyle,
      this.borderRadius,
      this.backgroundColor,
      this.width,
      this.height});

  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16)),
          backgroundColor: backgroundColor ?? ColorManager.mainBlue,
          minimumSize: Size(width?.w ?? double.infinity, height?.h ?? 60.h)),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TextStyles.font16whiteMedium,
      ),
    );
  }
}
