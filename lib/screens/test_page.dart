// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:warning_app/screens/home/home_page.dart';
//
// class TestPage extends StatefulWidget {
//   static String routeName ='testPage';
//   // final String tittle;
//   const TestPage({
//     Key? key, //required this.tittle
//   }) : super(key: key);
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   final TextEditingController pass = TextEditingController();
//
//   @override
//   void dispose(){
//     pass.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       actionsAlignment: MainAxisAlignment.spaceBetween,
//       title: Text('Password'),
//       content: TextFormField(
//         controller: pass,
//         // validator: (value){
//         //   if (value == null || value.isEmpty) {
//         //     return 'Please enter some text';
//         //   }
//         //   return null;
//         // },
//         decoration: InputDecoration(
//             hintText: 'Nhập password',
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
//       ),
//       actions: [
//         TextButton(
//           style: TextButton.styleFrom(
//             textStyle: Theme.of(context).textTheme.labelLarge,
//           ),
//           child: const Text('Cancel'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: const Text('Ok'),
//             onPressed: () {
//               if(pass.text=='1234'){
//                 showDialog(context: context,
//                     builder: (context){
//                       return AlertDialog(
//                         actionsAlignment: MainAxisAlignment.spaceBetween,
//                         title: Text('Warning!! Bạn đang '),
//                         content: Text('Bạn có chắc rằng muốn  không?'),
//                         actions: [
//                           TextButton(onPressed: (){
//                             Navigator.pushNamed(context, HomePage.routeName);
//                           }, child: Text('Cancel')),
//                           TextButton(onPressed: (){
//                             Navigator.pushNamed(context, HomePage.routeName);
//                           }, child: Text('Ok'))
//                         ],
//                       );
//                     });
//               } else{}
//             }
//         )
//       ],
//     );
//   }
//
// // String? errorMess(String? err){
// //   if(pass.text!='1234'){
// //     return 'wrong';
// //   }
// // }
// }