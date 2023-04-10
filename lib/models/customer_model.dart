import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:warning_app/constants/utils.dart';

class Customer {
  final String? id;
  final String name;
  final String email;
  final String imageUrl;
  final int phone;

  // Customer copyWith({
  //   String? name,
  //   String? imageUrl,
  //   String? email,
  //   int? phone,
  // }) {
  //   return Customer(
  //     name: name ?? this.name,
  //     imageUrl: imageUrl ?? this.imageUrl,
  //     phone: phone ?? this.phone,
  //     email: email ?? this.email,
  //   );
  // }

  Customer({required this.name, required this.email, required this.imageUrl, required this.phone, this.id});
  @override
  List<Object?> get props {
    return [name, imageUrl, email, phone];
  }

  // static Customer fromSnapshot(DocumentSnapshot snap) {
  //   var user = Customer(
  //     id: snap.id,
  //     name: snap['name'],
  //     email: snap['email'],
  //     imageUrl: snap['imageUrl'],
  //     phone: snap['phone'],
  //   );
  //   return user;
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'imageUrl': imageUrl,
  //   };
  // }

  getdataFromDatabase() async {
    final _firestore = await FirebaseAuth.instance.currentUser;
    if(_firestore != null){
      await FirebaseFirestore.instance.collection('User').doc(_firestore.uid).get().then((value) {
        name : value['name'];
        email : value['email'];
        imageUrl : value['imageUrl'];
        phone : value['phone'];
        id: value.id;
      }).onError((error, stackTrace) {
        Utils.toassMessage(error.toString());
      });
    }
  }

  static Customer user = Customer(name: "Cale", email: 'cale@gmail.com', imageUrl: 'https://cdn.myanimelist.net/images/characters/2/477265.jpg', phone: 123456);
}
