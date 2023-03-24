import 'package:flutter/material.dart';

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
            CustomElevateButton(title: 'Nạp Tiền', colo: buttonpuple,),
            CustomElevateButton(title: 'Rút Tiền', colo: buttonorange),
            CustomElevateButton(title: 'Bảo Trì', colo: buttonblue),
            CustomElevateButton(title: 'Đóng hệ thống', colo: buttongreen),
          ],
        ),
      ),
    );
  }
}

class CustomElevateButton extends StatelessWidget {
  final String title;
  final Color colo;

  const CustomElevateButton({
    Key? key, required this.title, required this.colo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: ElevatedButton(onPressed: (){},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(title, style: txt20,)),
      style: ElevatedButton.styleFrom(
        backgroundColor: colo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        // side: BorderSide(
        //   color: Colors.green
        // )
      ),),
    );
  }
}