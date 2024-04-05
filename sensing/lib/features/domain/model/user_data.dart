import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    required bool status,
    required String msg,
    required UserData data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class UserData with _$UserData {
  factory UserData({
    required String id,
    required String username,
    required String email,
    required String password,
    required int role_id,
    required String token,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}