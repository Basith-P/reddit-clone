import 'package:flutter/material.dart' show MaterialPage;
import 'package:routemaster/routemaster.dart';

import 'features/auth/views/login_view.dart';
import 'features/home/views/home_page.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage<void>(child: LoginView()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage<void>(child: HomePage()),
});
