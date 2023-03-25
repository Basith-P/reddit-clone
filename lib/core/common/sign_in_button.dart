import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/controller/auth_controller.dart';
import '../constants/image_paths.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  Future<void> _signInWithGoogle(WidgetRef ref) async {
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => _signInWithGoogle(ref),
      icon: Image.asset(ImagePaths.google, height: 32),
      label: Text(
        'Sign in with Google',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
