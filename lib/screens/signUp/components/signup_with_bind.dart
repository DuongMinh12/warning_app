import 'package:flutter/material.dart';
import 'package:warning_app/animation/fade_animation.dart';

import '../../../constants/add_all.dart';
import '../../../controllers/signup_controller.dart';
import '../../screens.dart';

class SignUpWithBindAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.5,
      Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(facebookicon),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    ),
                    Text(
                      'Facebook',
                      style: txt14!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    //Colors.blue.shade300,
                    Colors.blue.shade200
                  ]),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 40,
                width: 150,
                alignment: Alignment.center,
              ),
              onTap: () {
                buildShowDialog(context, 'Facebook log in', 'You have already log in with Facebook');
              },
            ),
            GestureDetector(
              onTap: () {
                buildShowDialog(context, 'Gmail log in', 'You have already log in with Gmail');
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(gmailicon),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    ),
                    Text(
                      'Gmail',
                      style: txt14!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.deepOrange,
                    //Colors.blue.shade300,
                    Colors.deepOrange.shade200
                  ]),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 40,
                width: 150,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<dynamic> buildShowDialog(BuildContext context, String title, String contexttxt) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(contexttxt),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
