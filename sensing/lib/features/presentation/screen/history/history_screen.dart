import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const selectedColor = Color(0xff1a73e8);
    final unselectedColor = Color(0xff5f6368);
    final tabs = [
      const Tab(text: '検知履歴'),
      const Tab(text: '操作履歴'),
    ];

    final tabController = useTabController(initialLength: tabs.length);

    useEffect(() {
      return () {
        tabController.dispose();
      };
    }, []);

    return Column(
      children: [
        TabBar(
          controller: tabController,
          labelColor: selectedColor,
          unselectedLabelColor: unselectedColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 4.0, color: selectedColor),
          ),
          tabs: tabs,
        ),
      ]
    );
  }
}