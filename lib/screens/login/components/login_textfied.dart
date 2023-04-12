import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';
import 'components_login.dart';
class LoginTextfield extends StatelessWidget {
  const LoginTextfield({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          InputContainer(
            child: TextField(
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                  icon: Icon(Icons.email, color: kPrimaryColor,),
                  hintText: 'Email',
                  border: InputBorder.none
              ),
            ),
          ),
          InputContainer(
            child: TextField(
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: kPrimaryColor,),
                  hintText: 'Password',
                  border: InputBorder.none
              ),
            ),
          ),
          SizedBox(height: 5,),
          ElevatedButton(onPressed: (){},child: Text('LOGIN', style: TextStyle(fontSize: 18, color: Colors.white),),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(size.width*0.8, 45),
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          ),)
        ],
      ),
    );
  }
}