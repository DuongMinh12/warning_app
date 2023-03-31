import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/widgets/widgets.dart';

class TestPage extends StatefulWidget {
  static String routeName ='testPage';
  // final String tittle;
  const TestPage({
    Key? key, //required this.tittle
  }) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hbjbjh'),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return CustomAlertDialog();
            });
          },
          child: Text('click me'),
        ),
      ),
    );
  }

// String? errorMess(String? err){
//   if(pass.text!='1234'){
//     return 'wrong';
//   }
// }
}