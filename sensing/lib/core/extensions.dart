
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:sensing/features/domain/model/device_info.dart';

extension DeviceInfoPlatformInstance on DeviceInfoPlugin {

  getPlatformDeviceInfo() async {
    if (Platform.isAndroid) {
      final androidDeviceInfo = await androidInfo;
      return  DeviceInfo(
          androidDeviceInfo.model, androidDeviceInfo.version.release);
    } else {
      final iOSDeviceInfo = await iosInfo;
      return DeviceInfo(iOSDeviceInfo.model, iOSDeviceInfo.systemVersion);
    }
  }
}