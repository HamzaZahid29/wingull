import 'package:flutter/material.dart';
import 'package:wingull/core/theme/app_theme.dart';

import 'core/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.lightTheme,
      routerConfig: appRoutes,
    );
  }
}
