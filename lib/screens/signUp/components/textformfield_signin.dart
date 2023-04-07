import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';

TextFormField reusabletextformfield(TextEditingController controler, String hintexttxt, String? validate(String? validateer), bool hideText) {
  return TextFormField(
    //onChanged: (value){},
    //focusNode: myFocusNode,
    obscureText: hideText,
    validator: validate,
    controller: controler,
    decoration: InputDecoration(
        labelText: hintexttxt,
        labelStyle: txtsignup,
        fillColor: Colors.white.withOpacity(0.9),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: deepPurpleAccents10),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black, width: 1))),
    cursorColor: Colors.black,
  );
}