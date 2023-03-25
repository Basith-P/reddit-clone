import 'package:flutter/material.dart';
import 'package:reddit_clone/core/constants/image_paths.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(ImagePaths.google, height: 32),
      label: Text(
        'Sign in with Google',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
