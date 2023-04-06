import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/screens/screens.dart';

// class SignUnController with ChangeNotifier {
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   void SignIn(String username, String email, String password) {
//     try {
//       auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password
//       ).then((value) {
//         print('Create new account');
//         Utils.toassMessage('User created successfully');
//         //Future.delayed(Duration(seconds: 2), () => {});
//       }).onError((error, stackTrace) {
//         Utils.toassMessage(error.toString());
//       });
//     } catch (e) {
//       Utils.toassMessage(e.toString());
//     };
//   }
// }

void SignUp(BuildContext context, String email, String password, String username) {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  try {
    auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {

      ref.child(value.user!.uid.toString()).set({
        'uid' : value.user!.uid.toString(),
        'name' : username,
        'email' : value.user!.email.toString(),
        'phone' : '12234589',
        'imageUrl' : '',
      }).then((value) {
        Navigator.pushNamed(context, DrawerMenu.routeName);
      }).onError((error, stackTrace) {
        print(error);
        Utils.toassMessage(error.toString());
      });


      print('Create new account');
      //Utils.toassMessage('User created successfully');
      Future.delayed(Duration(seconds: 2), () => {});
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
