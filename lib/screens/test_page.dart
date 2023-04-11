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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../constants/add_all.dart';
 class TestPage extends StatefulWidget {
   const TestPage({Key? key}) : super(key: key);
 static String routeName = 'testPage';

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String? name ='';
  String? phone ='';
  String? email = '';
  String? imageUrl = catNetword;

  Future getData() async{
    await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) async{
      if(value.exists){
        setState(() {
          name = value['name'];
          email = value['email'];
          phone = value['phone'];
          imageUrl = value['imageUrl'];
        });
        //cus.id = value.data()!['id'];
      }
      print(name);
    });
  }
  @override
  void initState(){
    super.initState();
    getData();
  }

   @override
   Widget build(BuildContext context) {
    // Customer customer;
     //getData();
     return Scaffold(
       appBar: AppBar(
         leading: IconButton(onPressed: (){
           ZoomDrawer.of(context)!.open();
         }, icon: Icon(Icons.arrow_back_ios_new_rounded),),
       ),
       body: Container(
         //alignment: Alignment.center,
         //height: 300,
         width: double.infinity,
         decoration: BoxDecoration(
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             loginElevateButton(),
             SizedBox(
               height: 35,
                 child: VerticalDivider(thickness: 2,)),
             loginElevateButton(),
             SizedBox(
                 height: 35,
                 child: VerticalDivider(thickness: 2,)),
             loginElevateButton(),
           ],
         ),

         // Row(
         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
         //   children: [
         //     Container(color: Colors.blue,
         //     height: 150, width: 150,),
         //     VerticalDivider(thickness: 3,),
         //     Container(color: Colors.red,
         //       height: 150, width: 150,)
         //   ],
         // ),
       ),
     );
   }
  ElevatedButton loginElevateButton(){
    return ElevatedButton(onPressed: (){}, child: Icon(Icons.face), style: ElevatedButton.styleFrom(backgroundColor: Colors.red),);
  }
}


