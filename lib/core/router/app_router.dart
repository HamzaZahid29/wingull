import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/pages/login_screen.dart';
import 'app_static_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GoRouter appRoutes = GoRouter(
  initialLocation: AppStaticRoutes.loginPage,
  navigatorKey: _rootNavigatorKey,
  redirect: (BuildContext context, GoRouterState state) async {
    // final isAuthenticated = await SharedPrefsService.isAuthenticated();
    // final protectedRoutes = [AppStaticRoutes.homePage];
    // final currentPath = state.uri.path;
    //
    // if (!isAuthenticated && protectedRoutes.contains(currentPath)) {
    //   return AppStaticRoutes.loginScreen;
    // }
    //
    // return null;
  },
  routes: [
    GoRoute(
      path: AppStaticRoutes.loginPage,
      name: AppStaticRoutes.loginPage,
      pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
    ),
  ],
);
