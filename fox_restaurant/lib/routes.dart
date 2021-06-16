import 'package:flutter/widgets.dart';
import 'package:fox_res/screens/forgot_password/forgot_password_screen.dart';
import 'package:fox_res/screens/login_success/login_success_screen.dart';
import 'package:fox_res/screens/sign_in/sign_in_screen.dart';
import 'package:fox_res/screens/splash/splash_screen.dart';

import 'homeScreen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  // HomeScreen.routeName: (context) => HomeScreen(),
};
