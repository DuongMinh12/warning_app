import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/utils.dart';
import '../screens/screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void SignUp(BuildContext context, String email, String password, String username) {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      final _uid = value.user!.uid;
      //SessionController().userID = value.user!.uid.toString();
      firestore.collection('User').doc(_uid).set({
        'email' : email,
        'name' : username,
        'phone' : '132244',
        'imageUrl': '',
        'id' : value.user!.uid.toString(),
        'timeCreateAcc' : Timestamp.now(),
      }).then((value) {
        Utils.toassMessage('Create account successfully!');
        Future.delayed(Duration(seconds: 2), () => Navigator.pushNamed(context, DrawerMenu.routeName));
      }).onError((error, stackTrace) {
        Utils.toassMessage(error.toString());
      });

      print('Create new account');
      //Utils.toassMessage('User created successfully');
    }).onError((error, stackTrace) {
      print(error);
      Utils.toassMessage(error.toString());
    });
  } catch (e) {
    print(e);
    Utils.toassMessage(e.toString());
  }
  ;
}
