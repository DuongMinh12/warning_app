import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/models.dart';

import '../screens.dart';
import 'components/component_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String routeName = 'profilePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ZoomDrawer.of(context)!.open();
          // ZoomDrawer.of(context)!.toggle();
          //Navigator.pushNamed(context, BodyHomePage.routeName);
          },icon: Icon(Icons.menu, color: Colors.black,),),
        backgroundColor: Colors.white,elevation: 0,
        title: Text('Profile', style: txt20!.copyWith(fontWeight: FontWeight.w700),),
        // actions: [
        //   IconButton(onPressed: (){
        //     FirebaseAuth.instance.signOut().then((value){
        //       print('signed out');
        //       Navigator.pushNamed(context, LogInPage.routeName);
        //     });
        //   }, icon: Icon(Icons.logout, color: Colors.black,))
        // ],
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
                      backgroundColor: Colors.blue,
                      radius: 50,
                      backgroundImage: NetworkImage(Customer.user.imageUrl),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                        child: GestureDetector(
                          onTap: (){ print('Ok');},
                          child: Container(height: 30, width: 30, alignment: Alignment.center,
                          child: Icon(Icons.camera_alt_outlined, color: Colors.black, size: 20,),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(99)
                          ),),
                        )),
                  ],
                )),
            Text(
              Customer.user.name,
              style: txt18!.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 3,),
            Text(
              'New member',
              style: txt16!.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10,),
            buildProfile('User Name: ', Customer.user.name, Icon(Icons.perm_contact_cal, size: 25, color: Colors.black,)),
            buildProfile('Email: ', Customer.user.email, Icon(Icons.mail_outline, size: 25,color: Colors.black)),
            buildProfile('Phone: ', '${Customer.user.phone}', Icon(Icons.phone, size: 25,color: Colors.black)),
            SizedBox(height: 30,),
            Container(
              //alignment: Alignment.center,
             width: 160,
              height: 40,
              child: ElevatedButton(onPressed: (){}, child: Text('Edit Profile', style: txt15,),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),),
            ),

          ],
        ),
      ),
    );
  }
}
