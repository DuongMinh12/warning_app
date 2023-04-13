
import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';


Container buildProfile (String title, IconData icon){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: kPrimaryColor,),
        label: Text(title),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    ),
  );
}

Future<dynamic> dialogEditPro5(BuildContext context) {
  return showDialog(context: context, builder: (context){
            return AlertDialog(
              content: Text('gbjhgubjkg'),
            );
          });
}

Widget IDScan( String title, String image, Color color) {
  return ElevatedButton(onPressed: (){}, child: Row(
    children: [
      SizedBox(
        height: 25,
        width: 25,
        child: Image.network(image,),
      ),
      SizedBox(width: 8),
      Text(title)
    ],
  ),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30)
    ),
    backgroundColor: color,
    minimumSize: Size(150, 40),
  ),);
}