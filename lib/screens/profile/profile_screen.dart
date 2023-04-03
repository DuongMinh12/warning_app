import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
 static String routeName = 'profilePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vhjbhh'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(),
            Text('Profile screen'),
            Text('Profile screen',),
          ],
        ),
      ),
    );
  }
}
