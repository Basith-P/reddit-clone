import 'package:flutter/material.dart' show MaterialPage;
import 'package:reddit_clone/features/auth/views/login_view.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage<void>(child: LoginView()),
});
