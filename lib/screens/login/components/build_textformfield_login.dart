import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';

class BuildTextFormFile extends StatelessWidget {
  Widget? prefixIcon;
  //Widget?
  final TextEditingController controller;
  BuildTextFormFile({super.key, required this.controller, this.prefixIcon, required this.title, required this.validator, required this.obscureText});
  final String title;
  String? Function(String?)? validator;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
            filled: true,
            fillColor: kPrimaryColor.withAlpha(50),
            prefixIcon: prefixIcon,
            hintText: title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: (obscureText==true)? IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.eye, color: kPrimaryColor,)): null,
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: kPrimaryColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
