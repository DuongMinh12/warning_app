import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warning_app/constants/add_all.dart';
import 'components/signup_textfield.dart';

class SignUpBottomSheetSceen extends StatelessWidget {
  const SignUpBottomSheetSceen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double  defaultRegisterSize = size.height - (size.height*0.1);
    return SingleChildScrollView(
      child: Container(
        height: size.height-(size.height*0.1),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width,
            height: defaultRegisterSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 40,),
                Text('Welcome', style: loginstyle,),
                SizedBox(height: 40,),
                SvgPicture.asset(login),
                SizedBox(height: 20,),
                SignUpTextfield(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
