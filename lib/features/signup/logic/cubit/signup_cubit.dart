import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/features/signup/data/models/signup_request_model_body.dart';
import 'package:flutter_doctors_community_app/features/signup/data/repos/signup_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signUp(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignupState.success(signupResponse));
    }, failure: (error) {
      emit(SignupState.failure(errMessage: error.failure.message ?? ''));
    });
  }
}
