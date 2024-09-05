import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctors_community_app/core/helpers/extensions.dart';
import 'package:flutter_doctors_community_app/core/routing/routes.dart';
import 'package:flutter_doctors_community_app/core/theming/colors.dart';
import 'package:flutter_doctors_community_app/core/theming/styles.dart';
import 'package:flutter_doctors_community_app/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter_doctors_community_app/features/login/logic/login_cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          failure: (error) {
            context.pop();
            showDialog(
              barrierColor: Colors.white30,
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  error,
                  style: TextStyles.font16whiteMedium
                      .copyWith(color: Colors.black38),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Got it',
                      style: TextStyles.font16whiteMedium
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
