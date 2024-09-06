import 'package:flutter_doctors_community_app/core/networking/api_error_handler.dart';
import 'package:flutter_doctors_community_app/core/networking/api_result.dart';
import 'package:flutter_doctors_community_app/core/networking/api_services.dart';
import 'package:flutter_doctors_community_app/features/signup/data/models/signup_request_model_body.dart';
import 'package:flutter_doctors_community_app/features/signup/data/models/signup_response_model.dart';

class SignUpRepo {
  final ApiServices apiServices;

  SignUpRepo(this.apiServices);

  Future<ApiResult<SignupResponse>> signUp(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await apiServices.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
