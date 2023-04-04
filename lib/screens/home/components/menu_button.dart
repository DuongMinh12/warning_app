import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../constants/add_all.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key, required this.press, required this.riveOnInnit,
  });
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInnit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(left: 16),
          height: 40, width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0,3), blurRadius: 10),]
          ),
          child: RiveAnimation.asset(iconmenurive, onInit: riveOnInnit,),
        ),
      ),
    );
  }
}