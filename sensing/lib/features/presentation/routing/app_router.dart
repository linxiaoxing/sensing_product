import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensing/features/presentation/common/components/error_message_widget.dart';
import 'package:sensing/features/presentation/routing/not_found_screen.dart';
import 'package:sensing/features/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:sensing/features/presentation/screen/splash/splash_screen.dart';
import 'package:sensing/features/presentation/screen/top/top_screen.dart';

part 'app_router.g.dart';

part 'routes.dart';
// This or other ShellRoutes keys can be used to display a child route on a different Navigator.
// i.e: use the rootNavigatorKey for a child route inside a ShellRoute
// which need to take the full screen and ignore that Shell.
// https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
class AppRouter extends _$AppRouter {
  @override
  GoRouter build() {
    return GoRouter(
      debugLogDiagnostics: true,
      restorationScopeId: 'router',
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/splash',
      routes: routes,
      redirect: (BuildContext context, GoRouterState state) {

      },
      errorBuilder: (_, state) => const NotFoundScreen(),
    );
  }
}
