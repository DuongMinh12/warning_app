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

  late SMITrigger failTrigger, successTrigger;
  late SMIBool isChecking, isHandsUp;
  late SMINumber looknum;
  Artboard? artboard;
  late StateMachineController stateMachineController;

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
    isHandsUp.change(false);
    isChecking.change(true);
    looknum.change(0);
  }

  moveEyes(value){
    looknum.change(value.length.toDouble());
  }

  handsUp(){
    isHandsUp.change(true);
    isChecking.change(false);
  }

  login() async{
    isHandsUp.change(false);
    isChecking.change(false);
    if(emailController.text == 'admin' && passwordController.text=='admin'){
      successTrigger.fire();
      Future.delayed(Duration(seconds: 2), () => Navigator.pushNamed(context, HomePage.routeName));

    } else {
      failTrigger.fire();
    }
  }

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
            )
          ],
        )
      ),
    );
  }
}
