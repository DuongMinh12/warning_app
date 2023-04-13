import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warning_app/constants/add_all.dart';
import 'components/signup_textfield.dart';

class SignUpBottomSheetSceen extends StatelessWidget {
  const SignUpBottomSheetSceen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    // double defaultRegisterSize = size.height - (size.height * 0.1);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                topLeft: Radius.circular(100)
            )
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: size.height*0.14,

        child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                //enableDrag: true,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100))),
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width,
                          //height: defaultRegisterSize,
                          height: size.height - (size.height * 0.15),
                          //color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Welcome',
                                style: loginstyle,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SvgPicture.asset(login),
                              SizedBox(
                                height: 20,
                              ),
                              SignUpTextfield(),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Text(
              'Don\'t have any account? Register',
              style: GestureRegisterStyle,
            )),
      ),
    );
  }
}
