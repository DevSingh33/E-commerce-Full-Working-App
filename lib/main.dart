import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

import 'package:e_commerce/routes.dart';
import 'package:e_commerce/theme.dart';
import 'package:e_commerce/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: mainTheme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
