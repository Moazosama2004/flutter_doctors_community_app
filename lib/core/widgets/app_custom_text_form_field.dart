import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.borderRadius,
    this.backgroundColor,
    this.suffixIcon,
    this.obscureText = false,
  });

  final String hintText;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Color? backgroundColor;
  final IconButton? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.h),
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyles.font14GrayRegular
                .copyWith(color: ColorManager.lighterGray),
        filled: true,
        fillColor: backgroundColor ?? ColorManager.lightGray,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.lighterGray,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.mainBlue,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        suffixIcon: suffixIcon,
        isDense: true,
      ),
      obscureText: obscureText,
    );
  }
}
