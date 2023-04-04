import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:warning_app/animation/rive_utils.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/rive_asset.dart';
import 'package:warning_app/screens/screens.dart';

import 'components/side_menu_title.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({Key? key}) : super(key: key);
  static String routeName = 'sideMenuPage';
  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  RiveAsset selectedMenu = sideMenu.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('bhjkbjkbjk'),
      // ),
      body: Container(
        color: kMainColor,
        width: 260,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const ListTile(
                leading: CircleAvatar(
                  //child: Image.network('https://cdn.myanimelist.net/images/characters/2/477265.jpg') ,
                  // Icon(
                  //   CupertinoIcons.person,
                  //   color: Colors.white,
                  // ),
                  backgroundImage: NetworkImage('https://cdn.myanimelist.net/images/characters/2/477265.jpg'),
                  backgroundColor: Colors.white24,
                ),
                title: Text(
                  'Cale Henituse',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  'New member',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30, bottom: 10),
                child: Text(
                  'Browse',
                  style: txt16!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              ...sideMenu.map((menu) => SideMenuTitle(
                    menu: menu,
                    riveonInit: (artboard) {
                      StateMachineController contronller = RiveUtils.getRiveController(artboard, stateMachineName: menu.stateMachineName);
                      menu.input = contronller.findSMI('active') as SMIBool;
                    },
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(Duration(seconds: 1), (){
                        menu.input!.change(false);
                        setState(() {
                          selectedMenu = menu;
                        });
                      });
                    },
                    isActive: selectedMenu == menu,
                  )),
              //SideMenuTitle(),
            ],
          ),
        ),
      ),
    );
  }
}
