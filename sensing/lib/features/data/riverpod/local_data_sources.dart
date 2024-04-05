
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensing/features/data/local/shared_prefs_storage_impl.dart';
import 'package:sensing/features/data/local/user_data_source_impl.dart';
import 'package:sensing/features/data/repository/user_repository_impl.dart';
import 'package:sensing/features/domain/local/user_data_source.dart';
import 'package:sensing/features/domain/model/device_info.dart';

part 'local_data_sources.g.dart';

@riverpod
DeviceInfo deviceInfo(DeviceInfoRef ref) {
  throw UnimplementedError();
}

@riverpod
PackageInfo packageInfo(PackageInfoRef ref) {
  throw UnimplementedError();
}

@riverpod
SharedPrefsStorageImpl sharedPrefsStorage(SharedPrefsStorageRef ref) {
  final SharedPrefsStorageImpl sharedPrefsStorage = SharedPrefsStorageImpl();
  sharedPrefsStorage.init();
  return sharedPrefsStorage;
}

@riverpod
UserDataSourceImpl userDataSource(UserDataSourceRef ref) {
  final storageService = ref.watch(sharedPrefsStorageProvider);
  final datasource = UserDataSourceImpl(storageService);
  return datasource;
}

@riverpod
UserRepositoryImpl userRepository(UserRepositoryRef ref) {
  final datasource = ref.watch(userDataSourceProvider);
  final repository = UserRepositoryImpl(datasource);
  return repository;
}