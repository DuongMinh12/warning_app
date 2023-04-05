import 'package:flutter/material.dart';

class MenuItem{
  final String nameitem;
  final IconData iconData;
  MenuItem(this.nameitem, this.iconData);
}

class MenuItems{
  static MenuItem home = MenuItem('Home', Icons.home);
  static MenuItem profile = MenuItem('Profile', Icons.person);
  static MenuItem help = MenuItem('Help', Icons.chat_outlined);

  static List<MenuItem> all = [
    home, help, profile
  ];
}
