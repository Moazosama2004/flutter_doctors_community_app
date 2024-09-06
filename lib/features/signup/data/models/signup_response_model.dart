import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  UserData? userData;
  bool? status;
  int? code;

  SignupResponse({this.message, this.userData, this.status, this.code});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.token, this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
