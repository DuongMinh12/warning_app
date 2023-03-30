import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warning_app/screens/screens.dart';

import '../../constants/add_all.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'homePage';
   HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState(){
  //   super.initState();
  //   loadDataa();
  // }
  //
  // void loadDataa() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     onPower = pref.getBool('save')??false;
  //   });
  // }
  // bool? onPower;

  List datahome=[
    ['Khóa Nạp Tiền', moneyicon, false],
    ['Khóa Rút Tiền', cashmoney, false],
    ['Bảo Trì', maintenance, false],
    ['Đóng Hệ Thống', systemicon, false],
  ];

  void powerSwithChange(bool value, int index) async{
   if(value ==true){
     return showDialog(context: context, builder: (context){
       return AlertDialog(
         title: Text('close?'),
         content: Text('close'),
         actions: [
           TextButton(onPressed: (){
             setState((){
               value = false;
               datahome[index][2]=value;
             });
             Navigator.pop(context);}, child: Text('Cancel')),
           TextButton(onPressed: (){
             setState((){
               value = true;
               datahome[index][2]=value;
             });
             Navigator.pop(context);}, child: Text('OK')),
         ],
       );
     });
   }
    setState((){
      datahome[index][2]=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LogInPage.routeName);
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  'Welcome to,',
                  style: txtwelcome,
                ),
                const Text(
                  'Blue Bear',
                  style: txthomestitle,
                ),
                SizedBox(height: 10,),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(height: 15,),
                Text(
                  'System Management',
                  style: txt18,
                ),
                Container(
                  height: 400,
                  child: GridView.builder(
                    itemCount: datahome.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/1.1),
                      itemBuilder: (context, indext){
                        return SmartDevicesWidget(
                          devicesname: datahome[indext][0],
                          devicesicon: datahome[indext][1],
                          power: datahome[indext][2],
                          onChanged: (value)=> powerSwithChange(value, indext),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

