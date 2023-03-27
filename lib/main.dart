import 'package:flutter/material.dart';
import 'package:warning_app/routes.dart';

import 'screens/screens.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: SplashPage.routeName,
    routes: routes,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       initialRoute: HomePage.routeName,
//       routes: routes,
//       debugShowCheckedModeBanner: false,
//
//     );
//   }
// }
