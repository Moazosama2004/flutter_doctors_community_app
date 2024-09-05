import 'dart:developer';

import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctors_community_app/core/helpers/extensions.dart';
import 'package:flutter_doctors_community_app/core/helpers/spacing.dart';
import 'package:flutter_doctors_community_app/core/routing/app_router.dart';
import 'package:flutter_doctors_community_app/core/routing/routes.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_doctors_community_app/core/widgets/app_custom_text_form_field.dart';
import 'package:flutter_doctors_community_app/core/widgets/app_cutom_text_button.dart';
import 'package:flutter_doctors_community_app/features/login/data/models/login_request_body_model.dart';
import 'package:flutter_doctors_community_app/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/widgets/already_have_an_account_widget.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/widgets/email_and_password.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 50.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpacing(height: 8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular.copyWith(height: 1.5.h),
              ),
              verticalSpacing(height: 36),
              EmailAndPassword(),
              verticalSpacing(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: checked,
                        activeColor: ColorManager.mainBlue,
                        onChanged: (bool? value) {
                          checked = value;
                          setState(
                            () {
                              log(checked.toString());
                            },
                          );
                        },
                      ),
                      Text(
                        'Remember me',
                        style: TextStyles.font12GrayRegular,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.forgotScreen);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.font12GrayRegular
                          .copyWith(color: ColorManager.mainBlue),
                    ),
                  ),
                ],
              ),
              verticalSpacing(
                height: 32.h,
              ),
              CustomTextButton(
                text: 'Login',
                onPressed: () {
                  log('email ${context.read<LoginCubit>().emailController.text}');
                  log('pass ${context.read<LoginCubit>().passwordController.text}');
                  validateThenDoLogin(context);
                },
              ),
              verticalSpacing(height: 170),
              Align(alignment: Alignment.center, child: TermsAndConditions()),
              verticalSpacing(height: 16),
              Align(alignment: Alignment.center, child: AlreadyHaveAccount()),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            LoginRequestBody(
                email: context.read<LoginCubit>().emailController.text,
                password: context.read<LoginCubit>().passwordController.text),
          );
    }
  }
}
