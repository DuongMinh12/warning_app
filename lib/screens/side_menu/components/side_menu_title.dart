import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:warning_app/models/rive_asset.dart';

import '../../../constants/add_all.dart';

class SideMenuTitle extends StatelessWidget {
  const SideMenuTitle({
    super.key, required this.menu, required this.press, required this.riveonInit, required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Divider(color: Colors.white24, height: 1,),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              left: 0,
              duration: Duration(milliseconds: 300),
              child: Container(
                decoration: BoxDecoration(
                color: Color(0xFF6792FF),
                borderRadius: BorderRadius.all(Radius.circular(10),
                )
              ),
              height: 56, width: isActive? 260: 0,),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveonInit,
                ),
              ),
              title: Text(menu.title, style: TextStyle(color: Colors.white),),
            ),
          ],
        )
      ],
    );
  }
}