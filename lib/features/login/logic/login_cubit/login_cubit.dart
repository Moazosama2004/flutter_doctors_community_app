import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/features/login/data/models/login_request_body_model.dart';
import 'package:flutter_doctors_community_app/features/login/data/repos/login_repo.dart';
import 'package:flutter_doctors_community_app/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _homeRepo;

  LoginCubit(this._homeRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _homeRepo.login(
      LoginRequestBody(
          email: emailController.text,
          password: passwordController.text),
    );
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.failure(errMessage: error.failure.message ?? ''));
      },
    );
  }
}
