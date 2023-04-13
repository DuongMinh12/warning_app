import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
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
  int phone = 0;
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ZoomDrawer.of(context)!.open();
          },icon: Icon(Icons.menu, color: Colors.black,),),
        backgroundColor: Colors.white,elevation: 0,
        title: Center(child: Text('Profile', style: txt20!.copyWith(fontWeight: FontWeight.w700),)),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                            child: Icon(Icons.add_a_photo_outlined, color: Colors.white, size: 19,),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
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
              buildProfile('User Name', Icons.person),
              buildProfile('Email', Icons.mail_outline),
              buildProfile('Phone Number', Icons.phone),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                print('Save');
              }, child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(335, 40),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )
              ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IDScan('Add Touch ID', touchid, Colors.indigoAccent),
                    IDScan('Add Face ID', faceid, Colors.deepPurpleAccent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
