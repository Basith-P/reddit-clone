import 'package:flutter/material.dart' show MaterialPage;
import 'package:routemaster/routemaster.dart';

import 'features/auth/views/login_view.dart';
import 'features/community/views/create_community_page.dart';
import 'features/home/views/home_page.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage<void>(child: LoginView()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomePage()),
  CreateCommunityPage.routeName: (_) =>
      const MaterialPage(child: CreateCommunityPage()),
});
