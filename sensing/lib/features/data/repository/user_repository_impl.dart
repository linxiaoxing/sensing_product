import 'package:sensing/core/exceptions/either.dart';
import 'package:sensing/core/exceptions/http_exception.dart';
import 'package:sensing/features/domain/local/user_data_source.dart';
import 'package:sensing/features/domain/model/user_data.dart';
import 'package:sensing/features/domain/repository/user_cache_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;

  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser();
  }

  @override
  Future<Either<AppException, UserData>> fetchUser() {
    return dataSource.fetchUser();
  }

  @override
  Future<bool> saveUser({required UserData user}) {
    return dataSource.saveUser(user: user);
  }

  @override
  Future<bool> hasUser() {
    return dataSource.hasUser();
  }
}