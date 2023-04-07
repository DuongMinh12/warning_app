// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:warning_app/models/customer_model.dart';
//
// abstract class BaseCustomerRepository{
//   Stream<List<Customer>> getAllCustomer();
// }
//
// class CustomerRepository extends BaseCustomerRepository{
//  FirebaseFirestore _firebaseFirestore;
//  CustomerRepository({FirebaseFirestore? firebaseFirestore}): _firebaseFirestore = firebaseFirestore?? FirebaseFirestore.instance;
//
//   @override
//   Stream<List<Customer>> getAllCustomer() {
//     return _firebaseFirestore.collection('User').snapshots().map((snapshots) {
//       return snapshots.docs.map((doc) => Customer.fromSnapshot(doc)).toList();
//     });
//   }
//
// }