import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'core/common/error_display.dart';
import 'core/common/loader.dart';
import 'core/global/keys.dart';
import 'core/models/user_model.dart';
import 'features/auth/controller/auth_controller.dart';
import 'router.dart';
import 'theme/palette.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  AppUser? appUser;

  void getData(WidgetRef ref, User user) async {
    appUser = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(user.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => appUser);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) => GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: MaterialApp.router(
              title: 'Reddit Clone',
              theme: Pallete.lightModeAppTheme,
              darkTheme: Pallete.darkModeAppTheme,
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: scaffoldMessengerKey,

              // Routemaster
              routeInformationParser: const RoutemasterParser(),
              routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
                if (data == null) return loggedOutRoute;
                getData(ref, data);
                return loggedInRoute;
              }),
            ),
          ),
          error: ((error, stackTrace) =>
              ErrorDisplay(message: error.toString())),
          loading: () => const Loader(),
        );
  }
}
