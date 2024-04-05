import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sensing/features/presentation/common/constants/constant.dart';
import 'package:sensing/features/presentation/screen/top/top.dart';

class TopScreen extends HookConsumerWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(TopDataSource.bottomBarIndex);
    final selectedIndexNotifier = ref.watch(TopDataSource.bottomBarIndex.notifier);

    return MaterialApp(
      home: Scaffold(
        appBar: GradientAppBar(
          title: Center(
              child: Constants.widgetOptions.elementAt(selectedIndex)
          ),
          gradient: const LinearGradient(
            colors: [Colors.black38, Colors.white24],
          ),
        ),
        body: const Stack(children: [
          Center(
            child: Text("body"),
          ),
        ]),
        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(seconds: 1),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            selectedIndexNotifier.changeBarIndex(index);
          },
          destinations: Constants.navBarItems,
        ),
      ),
    );
  }
}