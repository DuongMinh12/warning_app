import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/animation/fade_animation.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/screens.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  static String routeName = 'signUpPage';

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              Container(
                height: 400,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(bgimage), fit: BoxFit.fill)),
                child: Stack(
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
                                  'Sign Up',
                                  style: txtsignIntitle,
                                ),
                              ),
                            ))),
                  ],
                ),
              ),
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
                                FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
                                  print('Create new account');
                                  Navigator.pushNamed(context, HomePage.routeName);
                                }).onError((error, stackTrace) {
                                  print('Error ${error.toString()}');
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${error.toString()}')));
                                });
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
                    FadeAnimation(
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
                    ),
                    FadeAnimation(
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
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField reusabletextformfield(TextEditingController controler, String hintexttxt, String? validate(String? validateer), bool hideText) {
    return TextFormField(
      //onChanged: (value){},
      //focusNode: myFocusNode,
      obscureText: hideText,
      validator: validate,
      controller: controler,
      decoration: InputDecoration(
          labelText: hintexttxt,
          labelStyle: txtsignup,
          fillColor: Colors.white.withOpacity(0.9),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: deepPurpleAccents10),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.red, width: 1)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black, width: 1))),
      cursorColor: Colors.black,
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
