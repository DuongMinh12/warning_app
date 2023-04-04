import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/add_all.dart';

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
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),),
        backgroundColor: Colors.white,elevation: 0,
        title: Text('Profile', style: txt20!.copyWith(fontWeight: FontWeight.w700),),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value){
              print('signed out');
              Navigator.pushNamed(context, LogInPage.routeName);
            });
          }, icon: Icon(Icons.logout, color: Colors.black,))
        ],
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
                      backgroundImage: NetworkImage('https://cdn.myanimelist.net/images/characters/2/477265.jpg'),
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
              'Cale Henituse',
              style: txt18!.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 3,),
            Text(
              'New member',
              style: txt16!.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10,),
            buildContainerProfile('User Name: ', 'Cale Henituse', Icon(Icons.perm_contact_cal, size: 25,)),
            buildContainerProfile('Email: ', 'CaleCrossman@gmail.com', Icon(Icons.mail_outline, size: 25,)),
            buildContainerProfile('Phone: ', '01234567890', Icon(Icons.phone, size: 25,)),
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
