import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';


Container buildProfile (String titleProfile, String inforUsser, Icon iconP5){
  return Container(
    padding: EdgeInsets.only(left: 25),
    child: ListTile(
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
    ),
  );
}

// Container buildContainerProfile( String titleProfile, String inforUsser, Icon iconP5) {
//   return Container(
//     padding: EdgeInsets.only(left: 40, right: 40, top: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               margin: EdgeInsets.only(right: 10) ,
//               decoration: BoxDecoration(
//                   color: Colors.lightBlueAccent.withAlpha(80),
//                   borderRadius: BorderRadius.circular(99)
//               ),
//               height: 38, width: 38,
//               alignment: Alignment.center,
//               child: iconP5,),
//             Text(titleProfile, style: txt15!.copyWith(fontWeight: FontWeight.w600),),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 50.0, top: 3 ),
//           child: Text(inforUsser, style: txt15,),
//         ),
//         //SizedBox(height: 10,),
//         Divider(thickness: 1,)
//       ],
//     ),
//   );
// }