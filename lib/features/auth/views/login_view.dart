import 'package:flutter/material.dart';

import '../../../core/common/sign_in_button.dart';
import '../../../core/constants/image_paths.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(ImagePaths.logo, height: 40),
          centerTitle: true,
          actions: [
            TextButton(onPressed: () {}, child: const Text('Skip')),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dive into anything',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 60),
                Image.asset(
                  ImagePaths.loginEmote,
                  height: 200,
                ),
                const SizedBox(height: 48),
                SignInButton(),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ));
  }
}
