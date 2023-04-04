import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';
import '../../../models/models.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);
  static String routeName='bodyHomePage';
  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  ChangeStateModel changeStateModel = ChangeStateModel();
  TextEditingController txt = TextEditingController();

  List datahome=[
    ['Khóa Nạp Tiền', moneyicon, false],
    ['Khóa Rút Tiền', cashmoney, false],
    ['Bảo Trì', maintenance, false],
    ['Đóng Hệ Thống', systemicon, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.only(top: 0),
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed:(){
                            Navigator.pushNamed(context, SideMenuPage.routeName);
                          },
                          // onPressed: () {
                          //   FirebaseAuth.instance.signOut().then((value){
                          //     print('signed out');
                          //     Navigator.pushNamed(context, LogInPage.routeName);
                          //   });
                          // },
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ProfilePage.routeName);
                          },
                          icon: Icon(
                            Icons.person,
                            size: 30,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
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
                        height: 450,
                        child: GridView.builder(
                          //primary: false,
                          //physics: NeverScrollableScrollPhysics(),
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
        ),
      ),
    );
  }
  void powerSwithChange(bool value, int index) async{
    if(value ==true){
      return showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Nhập Mật Khẩu'),
          content: TextFormField(decoration: InputDecoration(
              hintText: 'Nhập mật khẩu'
          ),
            controller: txt,),
          actions: [
            TextButton(onPressed: (){
              setState((){
                value = false;
                datahome[index][2]=value;
              });
              Navigator.pop(context);}, child: Text('Cancel')),
            TextButton(onPressed: (){
              if(txt.text=='admin'){
                Navigator.pop(context);
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Warning'),
                    content: Text('Bạn có chắc rằng muốn tắt chương trình?'),
                    actions: [
                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text('cancel')),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        setState((){
                          value = true;
                          datahome[index][2]=value;
                        });
                      }, child: Text('ok'))
                    ],
                  );
                });
              } else{ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nhập lại mật khẩu')));}
            }, child: Text('OK')),
          ],
        );
      });
    }
    setState((){
      datahome[index][2]=value;
    });
  }
}

