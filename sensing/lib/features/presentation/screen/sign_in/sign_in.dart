import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensing/features/data/riverpod/local_data_sources.dart';
import 'package:sensing/features/data/riverpod/retrofit_client.dart';
import 'package:sensing/features/domain/model/user_data.dart';

part 'sign_in.g.dart';

@riverpod
class _SignInState extends _$SignInState {
  @override
  FutureOr<UserData?> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    final apiRepository = ref.watch(apiRepositoryProvider);
    final userRepository = ref.watch(userRepositoryProvider);
    final data = await apiRepository.login(email: email, password: password);
    data.fold((error) {
      state = AsyncValue.error(error.statusCode, StackTrace.current);
    }, (data) {
      state = AsyncValue.data(data);
      userRepository.saveUser(user: data);
    });
  }
}

class SignInDataSource {
  static final signIn = _signInStateProvider;
}
