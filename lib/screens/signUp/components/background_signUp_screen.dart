import 'package:flutter/material.dart';

import '../../../animation/fade_animation.dart';
import '../../../constants/add_all.dart';
import '../../screens.dart';

class BackgroundSignUpPage extends StatelessWidget {
  const BackgroundSignUpPage({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: FadeAnimation(
                1,
                Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(light1))),
                ))),
        Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: FadeAnimation(
                1.3,
                Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(light2))),
                ))),
        Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: FadeAnimation(
                1.5,
                Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(clock))),
                ))),
        Positioned(
            child: FadeAnimation(
                1.6,
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      title,
                      style: txtsignIntitle,
                    ),
                  ),
                ))),
      ],
    );
  }
}

class next_login_screen extends StatelessWidget {
  const next_login_screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        1.5,
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Do you have ready an account? ',
                style: TextStyle(color: txtpupel),
              ),
              GestureDetector(
                child: Text(
                  'Log In',
                  style: TextStyle(color: txtpupel, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.pushNamed(context, LogInPage.routeName);
                },
              ),
            ],
          ),
        ));
  }
}