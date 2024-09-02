import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font12GrayRegular.copyWith(
              color: ColorManager.morelighterGray,
            ),
          ),
          TextSpan(
            text: ' Terms & Conditions ',
            style: TextStyles.font13GrayRegular.copyWith(
             
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' and ',
            style: TextStyles.font12GrayRegular.copyWith(
              color: ColorManager.morelighterGray,
            ),
          ),
          TextSpan(
            text: ' PrivacyPolicy. ',
            style: TextStyles.font13GrayRegular.copyWith(
              height: 1.5,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
