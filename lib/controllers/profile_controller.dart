// import 'dart:html';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:warning_app/repositories/customer/customer_repository.dart';
//
// class ProfileController extends GetxController{
//   static ProfileController get instance => Get.find();
//
//   final _authRepo = Get.put(AuthenticatorResponsitory());
//   final _userRepo = Get.put(CustomerRepository());
//
//
//   getUserdata(){
//     final email = _authRepo.firebaseUser.value?.email;
//     if(email !=null){
//       _userRepo = getUserdata(email);
//     }
//   }
// }