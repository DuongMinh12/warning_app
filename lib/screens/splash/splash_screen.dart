import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:lottie/lottie.dart';
import 'package:warning_app/screens/screens.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static String routeName = 'splashPage';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage())));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            'Blue Bear',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 50,
              fontFamily: 'Pacifico'
            ),
          ),
          // SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
                child: Lottie.asset(bear),
            ),
            Lottie.asset(welcome),
          ],
        ),
      ),
    );
  }
}
