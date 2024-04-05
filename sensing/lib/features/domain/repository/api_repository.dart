import 'package:sensing/core/exceptions/either.dart';
import 'package:sensing/core/exceptions/http_exception.dart';
import 'package:sensing/features/domain/model/user_data.dart';

abstract class ApiRepository {

  Future<Either<AppException, UserData>> login(
      {required String email, required String password});
}