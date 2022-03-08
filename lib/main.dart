import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/screens/sign_in_screen/sign_in_screen.dart';
import 'package:e_commerce/screens/splash_screen/splash_screen.dart';
import 'package:e_commerce/theme.dart';

import 'package:flutter/material.dart';

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
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
      },
    );
  }
}
