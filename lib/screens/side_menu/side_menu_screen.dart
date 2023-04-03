import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/screens.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({Key? key}) : super(key: key);
  static String routeName = 'sideMenuPage';
  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bhjkbjkbjk'),
      ),
      body: Container(
        color: kMainColor,
        width: 288,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.white24,
                ),
                title: Text('Nguyen A', style: TextStyle(color: Colors.white),),
                subtitle: Text('New member', style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30, bottom: 10),
                child: Text('Browse', style: txt16!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Divider(thickness: 1,color: Colors.white24,),
              ),
              ListTile(
                onTap: (){},
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: RiveAnimation.asset(
                    iconrive,
                    artboard: 'HOME',
                    onInit: (artboard) {},
                  ),
                ),
                title: Text('Home', style: TextStyle(color: Colors.white),),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, TestPage.routeName);
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.trash),
                    Text('Test page')
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
