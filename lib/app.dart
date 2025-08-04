import 'package:flutter/material.dart';
import 'package:kutuku/router/app_router.dart';
import 'package:kutuku/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Kutuku',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,
    );
  }
}
