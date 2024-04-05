import 'package:dio/dio.dart';

import 'package:flutter_mock_web_server/flutter_mock_web_server.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sensing/features/data/sensing_api.dart';

late MockWebServer _server;
late SensingApiClient _client;
void main() {
  setUp(() async {
    _server = MockWebServer();
    await _server.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    _client = SensingApiClient(dio, baseUrl: _server.url);
  });

  tearDown(() {
    _server.shutdown();
  });

  test('test login httpCode 200', () async {
    print("test login httpCode 200");
    _server.enqueue(
        body: '''
        {
          "status": true,
          "msg": "login success",
          "data": {
                   "id": "bef4e154-53e3-4b42-a2f5-b43f2cc06ecd",
                   "username": "najibfikri",
                   "email": "najibfikri26@gmail.com",
                   "password": "jFm/wRUMPS7qVHHOqXs.pcRVc3Wa2o/pU3CAMav0GVqDAQG",
                   "role_id": 0,
                   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiJiZWY0ZTE1NC01M2UzLTRiNDItYTJmNS1iNDNmMmNjMDZlY2QiLCJJc0FkbWluIjpmYWxzZSwiRW1haWwiOiJuYWppYmZpa3JpMjZAZ21haWwuY29tIiwiUGFzc3dvcmQiOiIkMmEkMTAkVWNrNzkuakZtL3dSVU1QUzdxVkhIT3FYcy5wY1JWYzNXYTJvL3BVM0NBTWF2MEdWcURBUUciLCJleHAiOjE3MTE2MDQ2MzMsImlhdCI6MTcxMTU4NjYzMywiaXNzIjoic255a2tfaGVyZSJ9.IKNMZpRY7d6a4ESLO1XQjS--4EG6Tv4Uah3GyXfbeH4"
                  }
        }
        ''', httpCode: 200);
    final tasks = await _client.login("123456@gmail", "12345");
    expect(tasks.status, true);
  });

  test('test login httpCode 400', () async {
    print("test login httpCode 400");
    _server.enqueue(
        body: '{"status": false, "msg": "Invalid credentials"}',
        httpCode: 400
    );
    try {
      await _client.login("invalid_email@gmail.com", "invalid_password");
    } on DioException catch (e) {
      expect(e.response!.statusCode, 400);
    }
  });
}