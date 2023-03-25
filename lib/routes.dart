
import 'package:flutter/material.dart';
import 'package:warning_app/screens/home/home_page.dart';
import 'package:warning_app/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  PaymentPage.routeName: (context) => PaymentPage(),
  WithdrawMoneyPage.routeName: (context) => WithdrawMoneyPage(),
};