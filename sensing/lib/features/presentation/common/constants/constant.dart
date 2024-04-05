import 'package:flutter/material.dart';
import 'package:sensing/features/presentation/screen/history/history_screen.dart';

const kTextcolor = Color(0xFF241424);

class Constants {

  static const navBarItems = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.cell_wifi_outlined),
      selectedIcon: Icon(Icons.cell_wifi_rounded),
      label: 'Detection',
    ),
    NavigationDestination(
      icon: Icon(Icons.history_outlined),
      selectedIcon: Icon(Icons.history_rounded),
      label: 'History',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_outline_rounded),
      label: 'Profile',
    ),
  ];

  static List<Widget> widgetTitle = <Widget>[
    const Text('Top Page'),
    const Text('Detection Page'),
    const Text('History Page'),
    const Text('Profile Page'),
  ];

  static List<Widget> widgetBody = <Widget>[
    const Text('Top Page'),
    const Text('Detection Page'),
    const HistoryScreen(),
    const Text('Profile Page'),
  ];
}