import 'package:flutter/material.dart';

const kTextcolor = Color(0xFF241424);

class Constants {

  static const navBarItems = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
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
      selectedIcon: Icon(Icons.person_rounded),
      label: 'Profile',
    ),
  ];

  static List<Widget> widgetOptions = <Widget>[
    const Text('Top Page'),
    const Text('Detection Page'),
    const Text('History Page'),
    const Text('Profile Page'),
  ];
}