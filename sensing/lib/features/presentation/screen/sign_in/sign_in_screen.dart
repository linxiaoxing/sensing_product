import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sensing/features/presentation/common/components/loading_overlay.dart';
import 'package:sensing/features/presentation/screen/sign_in/sign_in.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(SignInDataSource.signIn.notifier);
    final _isLoading = useState(false);
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    ref.listen(SignInDataSource.signIn, (previous, next) async {
      if (next.hasError) {
        final message = next.error.toString();
        GoRouter.of(context).pushNamed("error_msg", pathParameters: {'message': message});
      } else {
        GoRouter.of(context).go("/");
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  const Text(
                    'Mail',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // ここで他のバリデーションルールを追加することもできます
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your password';
                      }
                      // ここで他のバリデーションルールを追加することもできます
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _isLoading.value = true;
                        userNotifier.login(_emailController.text, _passwordController.text).then((value) {
                          _isLoading.value = false;
                        });
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Text(
                    'or',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12.0),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
          Center(
            child: LoadingOverlay(isLoading: _isLoading.value), // インジケーターを中央に配置
          )
        ],
      ),
    );
  }
}
