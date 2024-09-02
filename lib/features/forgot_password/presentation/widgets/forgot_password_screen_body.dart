import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/helpers/spacing.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_doctors_community_app/core/widgets/app_custom_text_form_field.dart';
import 'package:flutter_doctors_community_app/core/widgets/app_cutom_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  const ForgotPasswordScreenBody({super.key});

  get obsecureText => null;

  get formKey => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 50.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: TextStyles.font24BlueBold,
            ),
            verticalSpacing(height: 8),
            Text(
              'At our app, we take the security of your information seriously.',
              style: TextStyles.font14GrayRegular.copyWith(height: 1.5.h),
            ),
            verticalSpacing(height: 36),
            const CustomTextFormField(
              hintText: 'Email or Phone Number',
            ),
            verticalSpacing(
              height: 32.h,
            ),
            Spacer(),
            CustomTextButton(
              text: 'Submit',
              onPressed: () {
                log('login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
