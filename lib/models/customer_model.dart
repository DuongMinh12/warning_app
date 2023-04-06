import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String name;
  final String email;
  final String imageUrl;
  final int phone;

  Customer({required this.name, required this.email, required this.imageUrl, required this.phone});

  static Customer fromSnapshot(DocumentSnapshot snap) {
    var user = Customer(name: snap['name'],
        email: snap['email'],
        imageUrl: snap['imageUrl'],
        phone: snap['phone']);
    return user;
  }
}
