
import 'package:sensing/core/exceptions/either.dart';
import 'package:sensing/core/exceptions/http_exception.dart';
import 'package:sensing/features/domain/model/user_data.dart';

abstract class UserDataSource {
  String get storageKey;

  Future<Either<AppException, UserData>> fetchUser();
  Future<bool> saveUser({required UserData user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}