import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctors_community_app/core/helpers/app_regex.dart';
import 'package:flutter_doctors_community_app/core/helpers/extensions.dart';
import 'package:flutter_doctors_community_app/core/helpers/spacing.dart';
import 'package:flutter_doctors_community_app/core/routing/app_router.dart';
import 'package:flutter_doctors_community_app/core/routing/routes.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_doctors_community_app/core/widgets/app_custom_text_form_field.dart';
import 'package:flutter_doctors_community_app/core/widgets/app_cutom_text_button.dart';
import 'package:flutter_doctors_community_app/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter_doctors_community_app/features/login/presentation/widgets/password_validations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool obsecureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please Enter a valid emaill';
              }
            },
            hintText: 'Email',
          ),
          verticalSpacing(height: 16),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter a valid password';
              }
            },
            hintText: 'Password',
            obscureText: obsecureText,
            suffixIcon: IconButton(
              onPressed: () {
                obsecureText = !obsecureText;
                setState(() {});
              },
              icon: Icon(
                obsecureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpacing(
            height: 24.h,
          ),
          PasswirdValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialChar: hasSpecialChar,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
