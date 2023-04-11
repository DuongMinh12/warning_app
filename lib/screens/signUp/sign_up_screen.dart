import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/animation/fade_animation.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/controllers/signup_controller.dart';
import 'package:warning_app/screens/screens.dart';

import 'components/componnents_route.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  static String routeName = 'signUpPage';

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _enterpasswordController = TextEditingController();

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeAnimation(1, Container(
                height: 370,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(bgimage), fit: BoxFit.fill)),
                child: BackgroundSignUpPage(title: 'Sign Up',),
              ),),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: FadeAnimation(
                          1.8,
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)), //color: Color(0x59A4A9F3), blurRadius: 20, offset: Offset(0, 10)),
                            ]),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Form(
                              key: _key,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Welcom my new friend!'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    reusabletextformfield(_usernameController, 'User Name', validatorCheckUserName, false),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    reusabletextformfield(_emailController, 'Email', validatorCheckUserName, false),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    reusabletextformfield(_passwordController, 'Password', validatorCheckPassword, true),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    reusabletextformfield(_enterpasswordController, 'Enter Password', validatorCheckPassword, true),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    FadeAnimation(
                      2,
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              //myFocusNode.requestFocus();
                              if (_key.currentState!.validate() && _enterpasswordController.text == _passwordController.text) {
                                SignUp(context,_emailController.text, _passwordController.text, _usernameController.text);
                              }
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [Color.fromRGBO(143, 148, 251, 1), Color.fromRGBO(143, 148, 251, .6)]),
                              ),
                              child: Text(
                                'Register',
                                style: txt16!.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.5,
                      Text(
                        'Or',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Alkatra', color: Colors.deepPurpleAccent.shade200),
                      ),
                    ),
                    SignUpWithBindAccount(),
                    next_login_screen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  String? validatorCheckUserName(String? validatorerror) {
    if (validatorerror!.isEmpty) {
      return 'Bạn chưa nhập Email';
    } else {
      return null;
    }
  }

  String? validatorCheckPassword(String? validatorerror) {
    if (validatorerror!.isEmpty) {
      return 'Bạn chưa nhập mật khẩu';
    } else {
      return null;
    }
  }
}
