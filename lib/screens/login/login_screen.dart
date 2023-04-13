import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/screens.dart';
import '../signUp/components/componnents_route.dart';
import 'components/components_login.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  static String routeName = 'logInPage';

  @override
  Widget build(BuildContext context) {
    Size size = Size(400, 780);
    return Scaffold(
      //backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: -20,
                  left: -50,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -50,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size.width,
                    height: size.height - (size.height * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Welcome Back',
                          style: loginstyle,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SvgPicture.asset(login),
                        SizedBox(
                          height: 40,
                        ),
                        LoginTextfield(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SignUpBottomSheetSceen(size: size,),
          ],
        ),
      ),
    );
  }
}
