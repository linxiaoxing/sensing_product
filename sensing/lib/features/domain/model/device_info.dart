import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';
part 'device_info.g.dart';

@freezed
class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo(String model, String osVersion) = $_DeviceInfo;

  // JsonSerializedを追加
  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);
}