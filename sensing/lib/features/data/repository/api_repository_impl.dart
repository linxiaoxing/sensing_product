import 'package:dio/dio.dart';
import 'package:sensing/core/exceptions/either.dart';
import 'package:sensing/core/exceptions/http_exception.dart';
import 'package:sensing/features/data/sensing_api.dart';
import 'package:sensing/features/domain/model/user_data.dart';
import 'package:sensing/features/domain/repository/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiRepositoryImpl extends ApiRepository {

  final SensingApiClient _apiClient;

  ApiRepositoryImpl(this._apiClient);

  @override
  Future<Either<AppException, UserData>> login(
      {required String email, required String password}) async {
    try {
      fetchData();
      final response = await _apiClient.login(email, password);
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(AppException(
          identifier: e.response?.statusMessage ?? "",
          statusCode: e.response?.statusCode ?? 400,
          message: e.message ?? "",
        )); // エラーが発生した場合はLeft型でエラーをラップして返す
      } else {
        return Left(AppException(
          identifier: "request error",
          statusCode: 400,
          message: "unKnown",
        ));
      }
    }
  }

  // test用
  void fetchFromApi() async {
    var url = Uri.parse('http://192.168.1.51:8080/api/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  // test用
  void fetchData() async {
    try {
      var dio = Dio();
      var response = await dio.get('http://192.168.1.51:8080/api/');

      if (response.statusCode == 200) {
        print('Response body: ${response.data}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}