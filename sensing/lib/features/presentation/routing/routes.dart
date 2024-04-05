part of 'app_router.dart';

final routes = <RouteBase>[
  GoRoute(
    name: "top",
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const TopScreen();
    },
  ),
  GoRoute(
    name: "splash",
    path: '/splash',
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    name: "sign_in",
    path: '/sign_in',
    builder: (BuildContext context, GoRouterState state) {
      return SignInScreen();
    },
  ),
  GoRoute(
    name: "error_msg",
    path: '/error_msg/:message',
    builder: (BuildContext context, GoRouterState state) {
      return ErrorMessageWidget(state.pathParameters["message"]!);
    },
  ),

];