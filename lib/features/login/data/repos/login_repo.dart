import 'package:flutter_doctors_community_app/core/networking/api_error_handler.dart';
import 'package:flutter_doctors_community_app/core/networking/api_result.dart';
import 'package:flutter_doctors_community_app/core/networking/api_services.dart';
import 'package:flutter_doctors_community_app/features/login/data/models/login_request_body_model.dart';
import 'package:flutter_doctors_community_app/features/login/data/models/login_response_model.dart';

class LoginRepo {
  final ApiServices apiServices;

  LoginRepo(this.apiServices);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async{
    try {
      final response = await apiServices.login(loginRequestBody);
      return ApiResult.success(response);
    } 
    catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
}
