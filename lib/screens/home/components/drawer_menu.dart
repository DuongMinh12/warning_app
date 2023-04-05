import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:warning_app/models/menu_item_model.dart';
import 'package:warning_app/screens/home/components/drawer_menu_change_page.dart';
import 'package:warning_app/screens/screens.dart';
import '../../../constants/add_all.dart';
import '../../../models/rive_asset.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  MenuItem currentItem =MenuItems.home;
  @override
  Widget build(BuildContext context) {
  return ZoomDrawer(
    menuBackgroundColor: Colors.grey.shade200,
    // menuBackgroundColor: Colors.blue,
  mainScreenTapClose: true, menuScreenTapClose: true,
  menuScreen: MenuBody(), mainScreen: BodyHomePage(),
  style: DrawerStyle.defaultStyle,
    //borderRadius: 30,
  );
}}

