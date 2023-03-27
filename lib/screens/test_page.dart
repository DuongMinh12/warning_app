import 'package:flutter/material.dart';
import 'package:warning_app/screens/home/home_page.dart';

class TestPage extends StatefulWidget {
  static String routeName ='testPage';
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          showDialog(
            barrierDismissible: false,
              context: context,
              builder: (_) => AlertDialog(
                content: Text('bkbnjkn'),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Ok'),
                      onPressed: () {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            content: Text('test'),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pushNamed(context, HomePage.routeName);
                              }, child: Text('ok'))
                            ],
                          );
                        });
                        // Navigator.of(context).pop();
                      }
                  )
                ],

              )
          );
        }, child: Text('bjkbjkb'),),
      ),
    );
  }
}


// class _YourWidgetState extends State<YourWidget> {
//
//   AlertDialog alert = AlertDialog(content: Center(child:Text("Second Alert Dialog")));
//
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(onPressed: (){
//       showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             content: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState){
//                   return Column(
//                     children: <Widget>[
//                       RaisedButton( onPressed: (){
//                         showDialog(context: context, builder: (_) => alert);
//                       }),
//                       RaisedButton(onPressed: (){
//                         showDialog(context: context, builder: (_) => alert);
//                       }),
//                     ],
//                   );
//                 }
//             ),
//           )
//       );
//     });
//   }
// }