import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/menu_item_model.dart';
import 'package:warning_app/models/models.dart';
import 'package:warning_app/screens/screens.dart';

class MenuBody extends StatefulWidget {
  MenuBody({Key? key, required this.onSelectItem, required this.currentItem}) : super(key: key);
  final ValueChanged<MenuItem> onSelectItem;
  final MenuItem currentItem;

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  String? name ='Unknow';
  String? email = 'Unknow';
  String? imageUrl = catNetword;

  Future getData() async{
    await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) async{
      if(value.exists){
        setState(() {
          name = value['name'];
          email = value['email'];
          imageUrl = value['imageUrl'];
        });
        //cus.id = value.data()!['id'];
      }
    });
  }
  @override
  void initState(){
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.only(top: 40, ),
          color: kMainColor, //Colors.blueAccent.shade400,
          child: Column(
            children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: (imageUrl=='')? NetworkImage(catNetword): NetworkImage(imageUrl!),
                  backgroundColor: Colors.white24,
                ),
              SizedBox(height: 10,),
              Text(
                name!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 5,),
              Text(
                email!,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5),
                child: Divider(thickness: 1.2,),
              ),
              ...MenuItems.all.map(buildMenuItem).toList(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Divider(),
              ),
              ListTile(
                minLeadingWidth: 20,
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: (){
                  FirebaseAuth.instance.signOut().then((value){
                    print('signed out');
                    Navigator.pushNamed(context, LogInPage.routeName);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

   buildMenuItem (MenuItem item) => ListTile(
    minLeadingWidth: 20,
    selected: widget.currentItem == item,
    leading: Icon(item.iconData),
     title: Text(item.nameitem,),
     onTap: () => widget.onSelectItem(item),
  );
}