import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/auth/views/login_view.dart';
import 'firebase_options.dart';
import 'theme/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Clone',
      theme: Pallete.lightModeAppTheme,
      darkTheme: Pallete.darkModeAppTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
