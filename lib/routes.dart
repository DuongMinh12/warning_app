
import 'package:flutter/material.dart';
import 'package:warning_app/screens/home/home_page.dart';
import 'package:warning_app/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  SplashPage.routeName: (context) => SplashPage(),
  LogInPage.routeName: (context) => LogInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  TestPage.routeName: (context) => TestPage(),
  SideMenuPage.routeName: (context) => SideMenuPage(),
  // PaymentPage.routeName: (context) => PaymentPage(),
  // WithdrawMoneyPage.routeName: (context) => WithdrawMoneyPage(),
};