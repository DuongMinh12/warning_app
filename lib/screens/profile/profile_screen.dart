import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/models.dart';
import 'components/component_profile_page.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({Key? key}) : super(key: key);
  static String routeName = 'profilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name ='Unknow';
  String phone ='Unknow';
  String email = 'Unknow';
  String imageUrl = catNetword;
  Timestamp time = Timestamp.now() ;

  Future getData() async{
    await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) async{
      if(value.exists){
        setState(() {
          name = value['name'];
          email = value['email'];
          phone = value['phone'];
          imageUrl = value['imageUrl'];
          time = value['timeCreateAcc'];
        });
        //cus.id = value.data()!['id'];
      }
    });
  }
  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ZoomDrawer.of(context)!.open();
          },icon: Icon(Icons.menu, color: Colors.black,),),
        backgroundColor: Colors.white,elevation: 0,
        title: Center(child: Text('Profile', style: txt20!.copyWith(fontWeight: FontWeight.w700),)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      backgroundImage: (imageUrl=='')? NetworkImage(catNetword): NetworkImage(imageUrl!),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                        child: GestureDetector(
                          onTap: (){ print('ok');},
                          child: Container(height: 30, width: 30, alignment: Alignment.center,
                          child: Icon(Icons.add_a_photo_outlined, color: Colors.black, size: 20,),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.shade100,
                            borderRadius: BorderRadius.circular(99)
                          ),),
                        )),
                  ],
                )),
            Text(
             name!,
              style: txt18!.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 3,),
            Text(
              email!,
              style: txt16!.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 20,),
            buildProfile( context,'User Name: ', name!, Icon(Icons.perm_contact_cal, size: 25, color: Colors.black,)),
            buildProfile( context,'Time create account: ',DateFormat('dd/MM/yyyy').format(DateTime.parse(time!.toDate().toString())).toString() , Icon(Icons.schedule, size: 25,color: Colors.black)),
            buildProfile( context,'Phone: ', phone!, Icon(Icons.phone, size: 25,color: Colors.black)),
            IDScan( 'Touch ID', touchidicon),
            IDScan( 'Face ID', faceid),
            SizedBox(height: 30,),
            // Container(
            //   //alignment: Alignment.center,
            //  width: 160,
            //   height: 40,
            //   child: ElevatedButton(onPressed: (){
            //
            //   }, child: Text('Edit Profile', style: txt15,),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.lightBlueAccent,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30)
            //         )
            //     ),),
            // ),

          ],
        ),
      ),
    );
  }
}
