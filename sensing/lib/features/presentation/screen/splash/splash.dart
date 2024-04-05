import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensing/features/data/riverpod/local_data_sources.dart';

part 'splash.g.dart';

@riverpod
class _SplashState extends _$SplashState {
  @override
  Future<bool> build() {
    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.hasUser();
  }
}

class SplashDataSource {
  static final splash = _splashStateProvider;
}