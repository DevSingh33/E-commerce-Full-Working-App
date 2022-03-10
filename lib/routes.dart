import 'package:flutter/material.dart';

import 'package:e_commerce/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:e_commerce/screens/forgot_password%20_screen/forgot_password_screen.dart';
import 'package:e_commerce/screens/sign_in_screen/sign_in_screen.dart';
import 'package:e_commerce/screens/sign_in_success_screen/sign_in_success_screen.dart';
import 'package:e_commerce/screens/sign_up_screen/sign_up_screen.dart';
import 'package:e_commerce/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignInSuccessScreen.routeName: (context) => const SignInSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
};
