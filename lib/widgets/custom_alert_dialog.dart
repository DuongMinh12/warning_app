import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/home/home_page.dart';
import 'package:warning_app/widgets/widgets.dart';

class CustomAlertDialog extends StatefulWidget {
  final String tittle;
  // static bool control = false;
  const CustomAlertDialog({Key? key, required this.tittle}) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {

  // @override
  // void initState(){
  //   super.initState();
  //   loadDataa();
  // }
  //
  // void loadDataa() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     onPower = pref.getBool('save');
  //   });
  // }
  bool onPower = false;
  final TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void setData() async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('save', onPower);
    }
    
    return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: Text('Password'),
        content: TextFormField(
          controller: pass,
          decoration: InputDecoration(hintText: 'Nhập password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              // widget.control = false;
              Navigator.pop(context);
            },
          ),
          TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                if (pass.text == '1234') {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          title: Text('Warning!! Bạn đang ${widget.tittle}'),
                          content: Text('Bạn có chắc rằng muốn ${widget.tittle} không?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, HomePage.routeName);
                                },
                                child: Text('Cancel')),
                            TextButton(
                                onPressed: (){
                                  onPower = true;
                                  setData();
                                  Navigator.pop(context);
                                  //saveChange();
                                },
                                child: Text('Ok'))
                          ],
                        );
                      });
                }
                if (pass.text!='1234' && pass.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: StackWidgetRed(),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: StackWidgetYellow(),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                }
              })
        ],
      );
  }
}
