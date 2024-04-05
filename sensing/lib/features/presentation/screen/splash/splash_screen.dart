import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sensing/features/presentation/screen/splash/splash.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000)).then((value) {
        final hasUser = ref.watch(SplashDataSource.splash).valueOrNull ?? false;
        GoRouter.of(context).go(hasUser ? "/" : "/sign_in");
      });
    });
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.onSecondary,
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/logo.png', // ロゴ画像のファイルパス
          width: 100, // 画像の幅
          height: 100, // 画像の高さ
        ),
      ),
    );
  }
}