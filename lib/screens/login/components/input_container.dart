import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      decoration: BoxDecoration(
          color: kPrimaryColor.withAlpha(50),
          borderRadius: BorderRadius.circular(30)
      ),
      child: child,
    );
  }
}