import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warning_app/controllers/signup_controller.dart';

import '../../../constants/add_all.dart';
import '../../login/components/components_login.dart';

class SignUpTextfield extends StatefulWidget {
  const SignUpTextfield({
    super.key,
  });

  @override
  State<SignUpTextfield> createState() => _SignUpTextfieldState();
}

class _SignUpTextfieldState extends State<SignUpTextfield> {
  // final controller = Get.put(SignUpController());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _usernameControllersg =TextEditingController();
  TextEditingController _emailControllersg =TextEditingController();
  TextEditingController _passControllersg =TextEditingController();
  TextEditingController _phoneControllersg =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          BuildTextFormFile(
            obscureText: false,
            controller: _usernameControllersg,
            prefixIcon: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            title: 'Username',
            validator: validatorUsernamSignUP,
          ),
          BuildTextFormFile(
            obscureText: false,
            controller: _emailControllersg,
            prefixIcon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            title: 'Email',
            validator: validatorEmailSignUP,
          ),
          BuildTextFormFile(
            obscureText: false,
            controller: _phoneControllersg,
            prefixIcon: Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            title: 'Phone Number',
            validator: validatorPassSignUP,
          ),
          BuildTextFormFile(
            obscureText: true,
            controller: _passControllersg,
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            title: 'Password',
            validator: validatorPassSignUP,
          ),
          SizedBox(height: 5,),
          ElevatedButton(onPressed: (){
            if(_key.currentState!.validate()){
              SignUp(context, _usernameControllersg.text, _emailControllersg.text, _phoneControllersg.hashCode, _passControllersg.text);
            }
          },child: Text('SIGN UP', style: TextStyle(fontSize: 18, color: Colors.white),),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 40),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                )
            ),)
        ],
      ),
    );
  }

  @override
  String? validatorEmailSignUP(String? value){
    if(value!.isEmpty){
      return 'Bạn chưa nhập Email';
    }
    else{
      return null;
    }
  }
  String? validatorUsernamSignUP(String? value){
    if(value!.isEmpty){
      return 'Bạn chưa nhập Username';
    }
    else{
      return null;
    }
  }
  String? validatorPassSignUP(String? value){
    if(value!.isEmpty){
      return 'Bạn chưa nhập Password';
    }
    else{
      return null;
    }
  }
}