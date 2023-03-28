import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/home/home_page.dart';

class CustomAlertDialog extends StatefulWidget {
  final String tittle;
  // static bool control = false;
  const CustomAlertDialog({Key? key, required this.tittle}) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    pass.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
                                  // control = false;
                                  Navigator.pushNamed(context, HomePage.routeName);
                                },
                                child: Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  // control = true;
                                  Navigator.pushNamed(context, HomePage.routeName);
                                },
                                child: Text('Ok'))
                          ],
                        );
                      });
                }
                if (pass.text!='1234' && pass.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              // alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(color: Color(0xFFC72C41), borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text('Mật khẩu bạn nhập không đúng'),
                              )),
                          Positioned(
                              child: SvgPicture.asset(
                            close,
                            height: 30,
                            width: 30,
                          ),
                          top: -10,
                          left: -10,),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: SvgPicture.asset(
                              bearteddy,
                              height: 60,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
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
                      content: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: 50,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
                              child: Text('Bạn chưa nhập mật khẩu')),
                          Positioned(
                            child: SvgPicture.asset(
                              exclamation,
                              height: 30,
                              width: 30,
                            ),
                            top: -10,
                            left: -10,),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: SvgPicture.asset(
                              bearteddy,
                              height: 60,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
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

  // String? errorMess(String? err){
  //   if(pass.text!='1234'){
  //     return 'wrong';
  //   }
  // }
}
