import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';


Container buildProfile (BuildContext context, String titleProfile, String inforUsser, Icon iconP5){
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      children: [
        Divider(thickness: 1, height: 3,),
        ListTile(
          minLeadingWidth: 10,
          leading: Container(
            //margin: EdgeInsets.only(right: 10) ,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withAlpha(80),
                borderRadius: BorderRadius.circular(99)
            ),
            height: 38, width: 38,
            //alignment: Alignment.center,
            child: iconP5,),
          title: Text(titleProfile, style: txt16!.copyWith(fontWeight: FontWeight.w600),),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5 ),
            child: Text(inforUsser, style: txt15,),
          ),
          trailing: IconButton(onPressed: (){
            dialogEditPro5(context);
          }, icon: Icon(Icons.edit,),),
        ),
      ],
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


Padding IDScan( String title, String iconface) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Column(
      children: [
        Divider(thickness: 1, height: 3,),
        ListTile(
          leading: Container(
            //margin: EdgeInsets.only(right: 10) ,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withAlpha(80),
                borderRadius: BorderRadius.circular(99)
            ),
            height: 38, width: 38,
            //alignment: Alignment.center,
            child:Padding(
              padding: EdgeInsets.all(4),
              child: Image.network(iconface),
            )
            ),
          title: Text(title, style: txt16!.copyWith(fontWeight: FontWeight.w600)),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle),),
        ),
      ],
    ),
  );
}