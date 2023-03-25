import 'package:flutter/material.dart';
import 'package:warning_app/screens/screens.dart';

import '../../constants/add_all.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'homePage';
   const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('Blue Bear', style: titlestyle,),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 65,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, PaymentPage.routeName);
              },
                child: Container(
                    alignment: Alignment.center,
                    child: Text('Nạp Tiền', style: txt20,)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonpuple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  // side: BorderSide(
                  //   color: Colors.green
                  // )
                ),),
            ),
            Container(
              width: 200,
              height: 65,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, WithdrawMoneyPage.routeName);
              },
                child: Container(
                    alignment: Alignment.center,
                    child: Text('Rút Tiền', style: txt20,)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonorange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  // side: BorderSide(
                  //   color: Colors.green
                  // )
                ),),
            ),
            Container(
              width: 200,
              height: 65,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(onPressed: (){},
                child: Container(
                    alignment: Alignment.center,
                    child: Text('Bảo Trì', style: txt20,)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonblue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  // side: BorderSide(
                  //   color: Colors.green
                  // )
                ),),
            ),
            Container(
              width: 200,
              height: 65,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(onPressed: (){},
                child: Container(
                  alignment: Alignment.center,
                    child: Text('Close System', style: txt20,)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttongreen,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  // side: BorderSide(
                  //   color: Colors.green
                  // )
                ),),
            )
          ],
        ),
      ),
    );
  }
}

// class CustomElevateButton extends StatelessWidget {
//   final String title;
//   final Color colo;
//
//   const CustomElevateButton({
//     Key? key, required this.title, required this.colo
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 65,
//       margin: EdgeInsets.symmetric(vertical: 30),
//       child: ElevatedButton(onPressed: (){},
//         child: Container(
//           alignment: Alignment.center,
//           // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//             child: Text(title, style: txt20,)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: colo,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
//         // side: BorderSide(
//         //   color: Colors.green
//         // )
//       ),),
//     );
//   }
// }