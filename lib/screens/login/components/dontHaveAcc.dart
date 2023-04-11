import 'package:flutter/material.dart';

import '../../../animation/fade_animation.dart';
import '../../../constants/add_all.dart';
import '../../screens.dart';

class dontHaveAccount extends StatelessWidget {
  const dontHaveAccount({
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
                'You don\'t have any account? ',
                style: TextStyle(color: txtpupel),
              ),
              GestureDetector(
                child: Text(
                  'Register',
                  style: TextStyle(color: txtpupel, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.pushNamed(context, SignUpPage.routeName);
                },
              ),
            ],
          ),
        ));
  }
}