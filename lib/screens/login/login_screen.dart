import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/screens/screens.dart';
import '../../animation/fade_animation.dart';
import '../signUp/components/componnents_route.dart';
import 'components/dontHaveAcc.dart';
import 'components/loginIconButton.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  static String routeName = 'logInPage';

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        //appBar: AppBar(),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeAnimation(1, Container(
                height: 370,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(image: AssetImage(bgimage), fit: BoxFit.fill,),),
                child: BackgroundSignUpPage(title: 'Log In',),
              ),),
              //SizedBox(height: 400,),
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: const [
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
                                  Text('Welcome back!'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  reusabletextformfield(_emailController, 'Email', validatorCheckUserName, false),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  reusabletextformfield(_passwordController, 'Password', validatorCheckPassword, true),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(color: txtpupel, fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {
                                          //print('for');
                                           Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                  FadeAnimation(
                    2,
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 15, bottom:5),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value){
                                    Utils.toassMessage('Log In successfully');
                                    Future.delayed(Duration(seconds: 2), () => Navigator.pushNamed(context, DrawerMenu.routeName));
                                  }).onError((error, stackTrace){
                                    print(error);
                                    Utils.toassMessage(error.toString());
                                  });
                                }
                              },
                              child: Container(
                                height: 45,
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(143, 148, 251, 1), Color.fromRGBO(143, 148, 251, .6)
                                        ]
                                    )
                                ),
                                child: Text(
                                  'Log In',
                                  style: txt16!.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          GestureDetector(
                            onTap: (){
                              print('object');
                            },
                            child: Container(
                              width: 60,
                              height: 45,
                              child:Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Image.asset(fingerprint),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.grey,
                                    Colors.grey.shade300
                                  ]
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  loginIconButton(),
                  SizedBox(height: 15,),
                  dontHaveAccount(),
                ],
              ),
              )
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
