import 'package:flutter/material.dart';
import 'package:warning_app/models/menu_item_model.dart';

class MenuBody extends StatelessWidget {
  MenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(top: 40, ),
          color: Colors.blueAccent,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://cdn.myanimelist.net/images/characters/2/477265.jpg'),
                  backgroundColor: Colors.white24,
                ),
                title: Text(
                  'Cale Henituse',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  'New member',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              ...MenuItems.all.map(buildMenuItem).toList(),
            ],
          ),
        ),
      ),
    );
  }

   buildMenuItem (MenuItem item) => ListTile(
    minLeadingWidth: 20,
    leading: Icon(item.iconData),
     title: Text(item.nameitem),
     onTap: (){
      print('object');
     },
  );
}