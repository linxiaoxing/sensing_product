import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sensing/app.dart';
import 'package:sensing/core/extensions.dart';
import 'package:sensing/features/data/riverpod/local_data_sources.dart';
import 'package:sensing/firebase_options.dart';

part 'core/infrastructure/services/main_initializer.dart';

void main() async {
  final container = await _mainInitializer();

  if (container == null) {
    runApp(
       ProviderScope(
        overrides: [
          packageInfoProvider
              .overrideWithValue(await PackageInfo.fromPlatform()),
          deviceInfoProvider
              .overrideWithValue(await DeviceInfoPlugin().getPlatformDeviceInfo()),
          sharedPrefsStorageProvider
        ],
        child: const SensingApp(),
      ),
    );
  } else {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const SensingApp(),
      ),
    );
  }
}