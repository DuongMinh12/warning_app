
import 'package:flutter/material.dart';
import 'package:warning_app/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  LogInPage.routeName: (context) => LogInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  TestPage.routeName: (context) => TestPage(),
  BodyHomePage.routeName: (context) => BodyHomePage(),
  // PaymentPage.routeName: (context) => PaymentPage(),
  // WithdrawMoneyPage.routeName: (context) => WithdrawMoneyPage(),
};