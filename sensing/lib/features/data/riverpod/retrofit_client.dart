
// API Client
// APIアクセス用
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensing/core/utils/network_util.dart';
import 'package:sensing/features/data/repository/api_repository_impl.dart';
import 'package:sensing/features/data/riverpod/local_data_sources.dart';
import 'package:sensing/features/data/sensing_api.dart';
import 'package:sensing/features/domain/repository/api_repository.dart';

part 'retrofit_client.g.dart';

@riverpod
SensingApiClient sensingApiClient(SensingApiClientRef ref) {
  //final accessToken = ref.watch(AuthDataSource.accessToken);
  final deviceInfo = ref.watch(deviceInfoProvider);
  final packageInfo = ref.watch(packageInfoProvider);

  //final applicationLocale = ref.watch(applicationLocaleProvider);
  //final langCode = applicationLocale.languageCode;

  final client = SensingApiClient.newInstance(
      accessToken: "",//accessToken?.accessToken ?? "",
      version: packageInfo.version,
      userAgent: NetworkUtil.getUserAgent(deviceInfo, packageInfo),
      //languageCode: langCode,
  );
  return client;
}

@riverpod
ApiRepositoryImpl apiRepository(ApiRepositoryRef ref) {
  final sensingApiClient = ref.watch(sensingApiClientProvider);
  return ApiRepositoryImpl(sensingApiClient);
}