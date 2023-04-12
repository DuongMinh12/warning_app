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
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double  defaultLoginSize = size.height - (size.height*0.2);
    double  defaultRegisterSize = size.height - (size.height*0.1);
    return Scaffold(
      //backgroundColor: kBackground,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 40,),
                Text('Welcome Back', style: loginstyle,),
                SizedBox(height: 40,),
                SvgPicture.asset(login),
                SizedBox(height: 20,),
                LoginTextfield(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Don\'t have any account?'),
                    TextButton(onPressed: (){
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(100),
                                topLeft: Radius.circular(100)),
                          ),
                          backgroundColor: kBackground,
                          isScrollControlled: true,
                          context: context, builder: (context){
                        return SignUpBottomSheetSceen(size: size,);
                      });
                    }, child: Text('Register'))
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
