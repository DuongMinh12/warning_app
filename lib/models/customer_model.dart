import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Customer extends Equatable {
  String name;
  String email;
  String imageUrl;
  int phone;

  Customer copyWith({
    String? name,
    String? imageUrl,
    String? email,
    int? phone,
  }) {
    return Customer(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  Customer({required this.name, required this.email, required this.imageUrl, required this.phone});

  @override
  List<Object?> get props {
    return [name, imageUrl, email, phone];
  }

  // Future getdataFromDatabase() async {
  //   await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshots) {
  //     if (snapshots.exists) {
  //       name = snapshots.data()!['name'];
  //       email = snapshots.data()!['email'];
  //       imageUrl = snapshots.data()!['imageUrl'];
  //       phone = snapshots.data()!['phone'];
  //     }
  //   });
  // }

  Future getdataFromDatabase() async {
    await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshots) {
      if (snapshots.exists) {
        name = snapshots.data()!['name'];
        email = snapshots.data()!['email'];
        imageUrl = snapshots.data()!['imageUrl'];
        phone = snapshots.data()!['phone'];
      }
    });
  }

  // static Customer fromSnapshot(DocumentSnapshot snap) {
  //   var user = Customer(name: snap['name'],
  //       email: snap['email'],
  //       imageUrl: snap['imageUrl'],
  //       phone: snap['phone']);
  //   return user;
  // }
  //
  // Map<String, dynamic> toMap(){
  //   return {
  //     'name' : name,
  //     'email' : email,
  //     'phone' : phone,
  //     'imageUrl': imageUrl,
  //   };
  // }

  static Customer user = Customer(name: "Cale",
      email: 'cale@gmail.com',
      imageUrl: 'https://cdn.myanimelist.net/images/characters/2/477265.jpg', phone: 123456);

//   static Customer user1 = Customer(name: getdataFromDatabase().n,
//       email: 'cale@gmail.com',
//       imageUrl: 'https://cdn.myanimelist.net/images/characters/2/477265.jpg', phone: 123456);
 }

