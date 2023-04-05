import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/screens.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  static String routeName = 'logInPage';
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

   SMITrigger? failTrigger, successTrigger;
   SMIBool? isChecking, isHandsUp;
   SMINumber? looknum;
  Artboard? artboard;
  StateMachineController? stateMachineController;
  bool isvalue = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgcolorlogin,
      //appBar: AppBar(title: Text('bhjbjkb'),),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Log In', style: txtlogIn),
            if(artboard != null)
            SizedBox(
              //width: 400,
              height: 250,
              child: Rive(artboard: artboard!,),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              //margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Text('Hello my friend!'),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        borderRadius:  BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade600)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          //textInputAction: TextInputAction.next,
                          onTap: checking,
                          onChanged: ((value) => moveEyes(value)),
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email or User Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                          borderRadius:  BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade600)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          // validator: (value){
                          //   if(value!.isNotEmpty){
                          //     return 'Không được trống email';
                          //   }
                          //   else {return null;}
                          // },
                          onTap: handsUp,
                          controller: passwordController,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: isvalue,
                            onChanged: (bool? value){
                          setState(() {
                            isvalue = value!;
                        });}),
                        Text('Remember me'),
                        Spacer(),
                        ElevatedButton(onPressed: login, child: Text('Login'))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('You don\'t have an account? '),
                        GestureDetector(
                          child: Text('Register', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),),
                          onTap: (){Navigator.pushNamed(context, SignUpPage.routeName);},
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initArtboard();
  }
  initArtboard(){
    rootBundle.load(riveAnimation).then((value){
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      stateMachineController = StateMachineController.fromArtboard(art, 'Login Machine')!;
      if(stateMachineController != null){
        art.addController(stateMachineController!);
        for(var element in stateMachineController!.inputs){
          //print(element.name);
          if(element.name == 'isChecking'){
            isChecking = element as SMIBool;
          }
          else if(element.name == 'isHandsUp'){
            isHandsUp = element as SMIBool;
          }
          else if(element.name == 'trigSuccess'){
            successTrigger = element as SMITrigger;
          }
          else if(element.name == 'trigFail'){
            failTrigger = element as SMITrigger;
          }
          else if(element.name == 'numLook'){
            looknum = element as SMINumber;
          }
        }
      }
      setState(() {
        artboard = art;
      });
    });
  }

  checking(){
    isHandsUp!.change(false);
    isChecking!.change(true);
    looknum!.change(0);
  }

  moveEyes(value){
    looknum!.change(value.length.toDouble());
  }

  handsUp(){
    isHandsUp!.change(true);
    isChecking!.change(false);
  }

  login() async{
    isHandsUp!.change(false);
    isChecking!.change(false);
    if(_key.currentState!.validate()){
      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
        successTrigger!.fire();
        Future.delayed(Duration(seconds: 2), () => Navigator.pushNamed(context, BodyHomePage.routeName));
      }).onError((error, stackTrace){
        failTrigger!.fire();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${error.toString()}')));
      });
    }
  }
}
