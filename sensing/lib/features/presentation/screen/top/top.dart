import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top.g.dart';

@riverpod
class _BottomBarIndexState extends _$BottomBarIndexState {

  @override
  int build() {
    return 0;
  }

  void changeBarIndex(int index) {
    state = index;
  }
}

class TopDataSource {
  static final bottomBarIndex = _bottomBarIndexStateProvider;
}
