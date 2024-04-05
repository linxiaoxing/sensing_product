

import 'dart:convert';

import 'package:sensing/core/exceptions/either.dart';
import 'package:sensing/core/exceptions/http_exception.dart';
import 'package:sensing/features/domain/local/shared_prefs_storage.dart';
import 'package:sensing/features/domain/local/user_data_source.dart';
import 'package:sensing/features/domain/model/user_data.dart';
import 'package:sensing/features/presentation/common/constants/globals.dart';

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this.storageService);

  final SharedPrefsStorage storageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, UserData>> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'User not found',
        ),
      );
    }
    final userJson = jsonDecode(data.toString());

    return Right(UserData.fromJson(userJson));
  }

  @override
  Future<bool> saveUser({required UserData user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}