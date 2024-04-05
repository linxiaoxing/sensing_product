import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:sensing/features/domain/model/device_info.dart';

class NetworkUtil {
  static const _userAgentSeparator = "; ";

  static String getUserAgent(DeviceInfo deviceInfo, PackageInfo packageInfo) {
    final buffer = StringBuffer();
    buffer.write(Platform.operatingSystem);
    buffer.write(deviceInfo.osVersion);
    buffer.write(_userAgentSeparator);
    buffer.write(deviceInfo.model);
    buffer.write(_userAgentSeparator);
    buffer.write(packageInfo.packageName);
    buffer.write(' ');
    buffer.write(packageInfo.version);
    return buffer.toString();
  }
}
