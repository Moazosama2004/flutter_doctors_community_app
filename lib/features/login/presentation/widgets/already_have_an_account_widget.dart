import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/helpers/font_weight_helper.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account yet?  ',
            style: TextStyles.font12GrayRegular.copyWith(
              color: ColorManager.morelighterGray,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font14GrayRegular.copyWith(
              color: ColorManager.mainBlue,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ],
      ),
    );
  }
}
