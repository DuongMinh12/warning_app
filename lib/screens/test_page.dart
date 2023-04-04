// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:warning_app/models/change_state_model.dart';
// import 'package:warning_app/widgets/widgets.dart';
//
// class TestPage extends StatelessWidget {
//   static String routeName ='testPage';
//   // final String tittle;
//   TestPage({
//     //required this.testchange,
//     Key? key, //required this.changeStateModel
//   }) : super(key: key);
//   //bool changeStateModel;
//   //bool testchange;
//   bool? test;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('hbjbjh'),),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: (){
//                 showDialog(context: context, builder: (context){
//                   return CustomAlertDialog();
//                 });
//               },
//               child: Text('click me'),
//             ),
//             SizedBox(height: 20,),
//
//             Container(
//               color: (test==true)? Colors.blue: Colors.red,
//               height: 100,
//               width: 100,
//             ),
//             ElevatedButton(
//               onPressed: () async{
//                   await showDialog(context: context, builder: (context){
//                     return CustomAlertDialog();
//                   });
//                 //test = testchange;
//                 if(test == true){
//                   print('corect');
//                 } else {
//                   print('faile');
//                 }
//               },
//               child: Text('changestate button'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:warning_app/screens/profile/profile_screen.dart';
import 'package:warning_app/screens/side_menu/side_menu_screen.dart';

import '../../../constants/add_all.dart';
import '../../../models/models.dart';
import '../../../widgets/widgets.dart';
 class TestPage extends StatefulWidget {
   const TestPage({Key? key}) : super(key: key);
 static String routeName = 'testPage';
   @override
   State<TestPage> createState() => _TestPageState();
 }

 class _TestPageState extends State<TestPage> {
   @override
   Widget build(BuildContext context) {
     return Container(
       color: Colors.blue,
     );
   }
 }


