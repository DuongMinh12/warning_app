import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/screens/screens.dart';
import '../../animation/fade_animation.dart';
import '../signUp/components/componnents_route.dart';

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
        body: Column(
          children: [
            FadeAnimation(1, Container(
              height: 370,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(image: AssetImage(bgimage), fit: BoxFit.fill,),),
              child: BackgroundSignUpPage(title: 'Log In',),
            ),),
            //SizedBox(height: 400,),
            Expanded(child: SingleChildScrollView(
              child: Container(
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
                                  Text('Welcome back!'),
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
                                  // Row(
                                  //   children: [
                                  //     Checkbox(value: isChecked, onChanged: (bool? value){
                                  //       isChecked = value!;
                                  //     }),
                                  //     Text('Rmember me'),
                                  //   ],
                                  // ),
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
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 5),
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
                        ),
                        Text(
                          'Or',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Alkatra', color: Colors.deepPurpleAccent.shade200),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              loginElevateButton(),
                              // VerticalDivider(color: Colors.red, thickness: 5,),
                              // Container(color: Colors.red,height: 30,width: 30,),
                              loginElevateButton(),
                              loginElevateButton(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  //FadeAnimation(1.5, ElevatedButton(onPressed: (){}, child: Text('bjbjk'),)),
                  FadeAnimation(
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
                      )),

                ],
              ),
            ),
            ))
          ],
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

  ElevatedButton loginElevateButton(){
    return ElevatedButton(onPressed: (){}, child: Icon(Icons.face));
  }
}

//
// class LogInPage extends StatefulWidget {
//   const LogInPage({Key? key}) : super(key: key);
//   static String routeName = 'logInPage';
//   @override
//   State<LogInPage> createState() => _LogInPageState();
// }
//
// class _LogInPageState extends State<LogInPage> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   final _key = GlobalKey<FormState>();
//
//    SMITrigger? failTrigger, successTrigger;
//    SMIBool? isChecking, isHandsUp;
//    SMINumber? looknum;
//   Artboard? artboard;
//   StateMachineController? stateMachineController;
//   bool isvalue = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: bgcolorlogin,
//       //appBar: AppBar(title: Text('bhjbjkb'),),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Log In', style: txtlogIn),
//             if(artboard != null)
//             SizedBox(
//               //width: 400,
//               height: 250,
//               child: Rive(artboard: artboard!,),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//               //margin: EdgeInsets.symmetric(horizontal: 16),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12)
//               ),
//               child: Form(
//                 key: _key,
//                 child: Column(
//                   children: [
//                     Text('Hello my friend!'),
//                     SizedBox(height: 10,),
//                     Container(
//                       decoration: BoxDecoration(
//                         //color: Colors.blue,
//                         borderRadius:  BorderRadius.circular(8),
//                         border: Border.all(color: Colors.grey.shade600)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: TextFormField(
//                           //textInputAction: TextInputAction.next,
//                           onTap: checking,
//                           onChanged: ((value) => moveEyes(value)),
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             hintText: 'Email or User Name',
//                             hintStyle: TextStyle(color: Colors.grey),
//                             border: InputBorder.none
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15,),
//                     Container(
//                       decoration: BoxDecoration(
//                         //color: Colors.blue,
//                           borderRadius:  BorderRadius.circular(8),
//                           border: Border.all(color: Colors.grey.shade600)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: TextFormField(
//                           // validator: (value){
//                           //   if(value!.isNotEmpty){
//                           //     return 'Không được trống email';
//                           //   }
//                           //   else {return null;}
//                           // },
//                           onTap: handsUp,
//                           controller: passwordController,
//                           decoration: InputDecoration(
//                               hintText: 'Password',
//                               hintStyle: TextStyle(color: Colors.grey),
//                               border: InputBorder.none
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15,),
//                     Row(
//                       //mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Checkbox(value: isvalue,
//                             onChanged: (bool? value){
//                           setState(() {
//                             isvalue = value!;
//                         });}),
//                         Text('Remember me'),
//                         Spacer(),
//                         ElevatedButton(onPressed: login, child: Text('Login'))
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('You don\'t have an account? '),
//                         GestureDetector(
//                           child: Text('Register', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),),
//                           onTap: (){Navigator.pushNamed(context, SignUpPage.routeName);},
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     initArtboard();
//   }
//   initArtboard(){
//     rootBundle.load(riveAnimation).then((value){
//       final file = RiveFile.import(value);
//       final art = file.mainArtboard;
//       stateMachineController = StateMachineController.fromArtboard(art, 'Login Machine')!;
//       if(stateMachineController != null){
//         art.addController(stateMachineController!);
//         for(var element in stateMachineController!.inputs){
//           //print(element.name);
//           if(element.name == 'isChecking'){
//             isChecking = element as SMIBool;
//           }
//           else if(element.name == 'isHandsUp'){
//             isHandsUp = element as SMIBool;
//           }
//           else if(element.name == 'trigSuccess'){
//             successTrigger = element as SMITrigger;
//           }
//           else if(element.name == 'trigFail'){
//             failTrigger = element as SMITrigger;
//           }
//           else if(element.name == 'numLook'){
//             looknum = element as SMINumber;
//           }
//         }
//       }
//       setState(() {
//         artboard = art;
//       });
//     });
//   }
//
//   checking(){
//     isHandsUp!.change(false);
//     isChecking!.change(true);
//     looknum!.change(0);
//   }
//
//   moveEyes(value){
//     looknum!.change(value.length.toDouble());
//   }
//
//   handsUp(){
//     isHandsUp!.change(true);
//     isChecking!.change(false);
//   }
//
//   login() async{
//     isHandsUp!.change(false);
//     isChecking!.change(false);
//     if(_key.currentState!.validate()){
//       FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
//         successTrigger!.fire();
//         Future.delayed(Duration(seconds: 2), () => Navigator.pushNamed(context, DrawerMenu.routeName));
//       }).onError((error, stackTrace){
//         failTrigger!.fire();
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${error.toString()}')));
//       });
//     }
//   }
// }
