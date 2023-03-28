import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
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
  List datahome=[
    ['Khóa Nạp Tiền', moneyicon, false],
    ['Khóa Rút Tiền', cashmoney, false],
    ['Bảo Trì', maintenance, false],
    ['Đóng Hệ Thống', systemicon, false],
  ];

  void powerSwithChange(bool value, int index) async{
    final TextEditingController txt = TextEditingController();

    // if(value==true){
    //   await showDialog(context: context, builder: (context){
    //     return AlertDialog(
    //       actionsAlignment: MainAxisAlignment.spaceBetween,
    //       title: Text('Password'),
    //       content: TextFormField(
    //         // controller: txt,
    //         controller: txt,
    //         decoration: InputDecoration(hintText: 'Nhập password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    //       ),
    //       actions: [
    //         TextButton(onPressed: (){
    //           value = false;
    //           Navigator.pop(context);
    //         }, child: Text('Cancel')),
    //         TextButton(
    //             style: TextButton.styleFrom(
    //               textStyle: Theme.of(context).textTheme.labelLarge,
    //             ),
    //             child: const Text('Ok'),
    //             onPressed: () {
    //               if (txt.text == '1234') {
    //                 showDialog(
    //                     context: context,
    //                     builder: (context) {
    //                       return AlertDialog(
    //                         actionsAlignment: MainAxisAlignment.spaceBetween,
    //                         title: Text('Warning!! Bạn đang ${datahome[index][0]}'),
    //                         content: Text('Bạn có chắc rằng muốn ${datahome[index][0]} không?'),
    //                         actions: [
    //                           TextButton(
    //                               onPressed: () {
    //                                 value = false;
    //                                 Navigator.pushNamed(context, HomePage.routeName);
    //                               },
    //                               child: Text('Cancel')),
    //                           TextButton(
    //                               onPressed: () {
    //                                 Navigator.pushNamed(context, HomePage.routeName);
    //                                 value = true;
    //                               },
    //                               child: Text('Ok'))
    //                         ],
    //                       );
    //                     });
    //               }
    //               if (txt.text!='1234' && txt.text.isNotEmpty) {
    //                 ScaffoldMessenger.of(context).showSnackBar(
    //                   SnackBar(
    //                     content: StackWidgetRed(),
    //                     duration: Duration(seconds: 2),
    //                     behavior: SnackBarBehavior.floating,
    //                     backgroundColor: Colors.transparent,
    //                     elevation: 0,
    //                   ),
    //                 );
    //               }
    //               if(txt.text.isEmpty){
    //                 ScaffoldMessenger.of(context).showSnackBar(
    //                   SnackBar(
    //                     content: StackWidgetYellow(),
    //                     duration: Duration(seconds: 2),
    //                     behavior: SnackBarBehavior.floating,
    //                     backgroundColor: Colors.transparent,
    //                     elevation: 0,
    //                   ),
    //                 );
    //               }
    //             })
    //       ],
    //     );
    //   });
    // }
    if(value==true){
      await showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text(datahome[index][0]),
          content: Text('Bạn có chắc chắn không?'),
          actions: [
            TextButton(onPressed: (){value =false;
              Navigator.pop(context);}, child: Text('Cancle')),
            TextButton(onPressed: (){value = true; Navigator.pop(context);}, child: Text('Ok')),
          ],
        );
      });
    }
    setState(() {
      datahome[index][2]=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: kMainColor,
      //   title: Text(
      //     'Blue Bear',
      //     style: titlestyle,
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         // Container(
      //         //   height: 230,
      //         //   width: double.infinity,
      //         //   child: Image.asset(bluebear, fit: BoxFit.cover,),
      //         // ),
      //         Positioned(
      //           child: Container(
      //             decoration: BoxDecoration(color: kMainColor, borderRadius: BorderRadius.only(topRight: Radius.circular(999))),
      //             height: 180,
      //             width: 240,
      //           ),
      //         ),
      //         Positioned(
      //           bottom: -20,
      //             child: Container(
      //           height: 200,
      //           child: Lottie.asset(catWork),
      //         ))
      //       ],
      //     ),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
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
                    itemCount: 4,
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

