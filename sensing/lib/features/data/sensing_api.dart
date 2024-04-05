import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sensing/features/domain/model/api_result.dart';
import 'package:sensing/features/domain/model/user_data.dart';

//build_runner生成される.gファイルの名前。'これが書かれているファイル名.g.dart'
part 'sensing_api.g.dart';

@RestApi()
abstract class SensingApiClient {
  static newInstance({
    required String accessToken,
    required String userAgent,
    required String version,
    //required String languageCode
  }) {
    final dio = Dio();
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'User-Agent': userAgent,
      // 'Authorization': 'Bearer $accessToken',
      // 'X-Sumo-Version': version,
      //'Accept-Language': languageCode,
      'Time-Zone': 'Asia/Tokyo'
    };
    return SensingApiClient(dio,
        baseUrl: "http://${const String.fromEnvironment("SENSING_HOST")}");
  }

  factory SensingApiClient(Dio dio, {String baseUrl}) = _SensingApiClient;

  // ログイン --------------------------------------------------------------
  @POST("/api/v1/auth/login")
  Future<ApiResult<UserData>> login(@Field("email") String email, @Field("password") String password);
}