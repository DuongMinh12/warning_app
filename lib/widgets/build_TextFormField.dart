import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final String hintext;
  const BuildTextFormField({
    Key? key, required this.hintext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintext,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          )
      ),
    );
  }
}