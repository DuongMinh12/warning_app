import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:warning_app/animation/rive_utils.dart';
import 'package:warning_app/screens/screens.dart';
import 'components/menu_button.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'homePagehome';
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    late SMIBool isMenuClose;
    //bool isSideOpenMenu = true;

    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(width: 260, height: MediaQuery.of(context).size.height, child: SideMenuPage()),
          Transform.translate(
              offset: Offset(260, 0), child: Transform.scale(scale: 0.9,
              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(24)), child: TestPage()))),
          MenuButton( riveOnInnit: (artboard){
            StateMachineController controler = RiveUtils.getRiveController(artboard, stateMachineName: 'State Machine');
            isMenuClose = controler.findSMI('isOpen') as SMIBool;
            //isMenuOpen = false;
          },
            press: (){
              isMenuClose.value = !isMenuClose!.value;
              if(isMenuClose!.value==false){
                print('1');
              }
              // setState(() {
              //   isSideOpenMenu =isMenuOpen.value;
              // });
            },
          )
        ],
      ),
    );
  }
}
