
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResult<T> {
  const ApiResult({
    required this.status,
    required this.data,
    this.msg,
  });

  factory ApiResult.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$ApiResultFromJson(json, fromJsonT);

  static const success = 0;
  static const unknown = -1;
  final bool status;
  final T data;
  final String? msg;

  bool get isSuccess => status;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiResultToJson(this, toJsonT);

  @override
  String toString() => 'ApiResult{status: $status, data: $data, msg: $msg}';
}