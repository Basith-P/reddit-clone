import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/controller/auth_controller.dart';
import '../constants/image_paths.dart';
import 'loader.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  Future<void> _signInWithGoogle(WidgetRef ref) async {
    ref.read(authControllerProvider.notifier).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return ElevatedButton.icon(
      onPressed: isLoading ? null : () => _signInWithGoogle(ref),
      icon: isLoading
          ? const SizedBox.shrink()
          : Image.asset(ImagePaths.google, height: 32),
      label: isLoading
          ? Loader()
          : Text(
              'Sign in with Google',
              style: Theme.of(context).textTheme.titleMedium,
            ),
    );
  }
}
