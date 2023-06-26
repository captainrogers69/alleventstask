import 'package:alleventstask/config/router/app_router.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/config/themes/app_theme.dart';
import 'package:alleventstask/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class AllEventsApp extends StatelessWidget {
  const AllEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      navigatorKey: Navigate.instance.navigationKey,
      onGenerateRoute: AppRouter.generateRoute,
      title: "All Events App",
      home: const SplashScreen(),
    );
  }
}
