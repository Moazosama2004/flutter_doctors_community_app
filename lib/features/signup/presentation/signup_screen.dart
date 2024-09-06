import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctors_community_app/core/widgets/app_cutom_text_button.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/widgets/dont_have_account_text.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter_doctors_community_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter_doctors_community_app/features/signup/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:flutter_doctors_community_app/features/signup/presentation/widgets/signup_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpacing(height: 8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpacing(height: 36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpacing(height: 40),
                    CustomTextButton(
                      text: "Create Account",
                      textStyle: TextStyles.font16whiteMedium,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpacing(height: 16),
                    const TermsAndConditions(),
                    verticalSpacing(height: 30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
