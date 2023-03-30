import 'package:flutter/material.dart';
import 'package:warning_app/animation/fade_animation.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/screens.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static String routeName = 'signUpPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(light1))),
                        ))
                        ),
                    Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(light2))),
                        ))
                        ),
                    Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(clock))),
                        ))
                        ),
                    Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: txtsignIntitle,
                            ),
                          ),
                        ))
                        ),
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
                              child: FadeAnimation(1.8, Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: [
                                  BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20, offset: Offset(0, 10)), //color: Color(0x59A4A9F3), blurRadius: 20, offset: Offset(0, 10)),
                                ]),
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Column(
                                  children: [
                                    Text('Welcom my new friend!'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: deepPurpleAccents10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(hintText: 'Email or Phone number', hintStyle: txtsignup, border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: deepPurpleAccents10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(hintText: 'Password', hintStyle: txtsignup, border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 5,),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: deepPurpleAccents10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(hintText: 'Enter password', hintStyle: txtsignup, border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),)
                          ),
                          FadeAnimation(2, Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 5),
                              child: GestureDetector(
                                onTap: (){print('Ok');},
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
                          ),),
                          FadeAnimation(1.5, Text('Or', style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Alkatra', color: Colors.deepPurpleAccent.shade200
                          ),),),
                          FadeAnimation(1.5, Container(
                            margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Image.asset(facebookicon),
                                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                      ),
                                      Text('Facebook', style: txt14!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          //Colors.blue.shade300,
                                          Colors.blue.shade200
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 40,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Image.asset(gmailicon),
                                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                      ),
                                      Text('Gmail', style: txt14!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.deepOrange,
                                          //Colors.blue.shade300,
                                          Colors.deepOrange.shade200
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 40,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),),
                          FadeAnimation(1.5, Center(
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
                                  onTap: (){Navigator.pushNamed(context, LogInPage.routeName);},),
                              ],
                            ),
                          )),
                        ],
                      ),
                  ),
            ],
          ),
      ),
    );
  }
}

// body: Container(
// width: double.infinity,
// decoration: BoxDecoration(
// gradient:  LinearGradient(
// begin: Alignment.topCenter,
// colors: [
// Colors.blue.shade900,
// Colors.blue.shade800,
// Colors.blue.shade400,
// ]
// )
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(top:80.0, bottom: 10),
// child: Text('SIGN UP', style: titlestyle,),
// ),
// Text('Welcome', style: txt18,),
// SizedBox(height: 15,)
// ],
// ),
// ),
// Expanded(child: Container(
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
// ),
// child: Column(
// children: [
// Padding(
// padding: const EdgeInsets.only(top: 65.0, left: 16, right: 16),
// child: Container(
// //height: 30,
// decoration: BoxDecoration(
// //color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.blue.shade100, //fromARGB(225, 95, 27, 3),
// blurRadius: 20,
// offset: Offset(0, 10)
// )
// ],
// borderRadius: BorderRadius.circular(10)
// ),
// child: Column(
// children: [
// Container(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
// child: TextField(
// decoration: InputDecoration(
// border: InputBorder.none,
// hintText: 'Email or phone number',
// hintStyle: TextStyle(color: Colors.grey)
// ),
// ),
// ),
// decoration: BoxDecoration(
// boxShadow: [
// BoxShadow(
// color: Colors.blue.shade100, //fromARGB(225, 95, 27, 3),
// blurRadius: 20,
// offset: Offset(0, 10)
// )
// ],
// borderRadius: BorderRadius.circular(10),
// color: Colors.white,
// ),
//
// ),
// Container(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
// child: TextField(
// decoration: InputDecoration(
// border: InputBorder.none,
// hintText: 'Password',
// hintStyle: TextStyle(color: Colors.grey)
// ),
// ),
// ),
// )
// ],
// ),
// ),
// )
// ],
// ),
// )
// )
// ],
// ),
// ),
