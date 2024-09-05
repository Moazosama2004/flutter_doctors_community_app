import 'package:dio/dio.dart';
import 'package:flutter_doctors_community_app/core/helpers/parse_error_logger.dart';
import 'package:flutter_doctors_community_app/core/networking/api_constants.dart';
import 'package:flutter_doctors_community_app/features/login/data/models/login_request_body_model.dart';
import 'package:flutter_doctors_community_app/features/login/data/models/login_response_model.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
