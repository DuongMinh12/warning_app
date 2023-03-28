import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/widgets/widgets.dart';

class SmartDevicesWidget extends StatelessWidget {
  SmartDevicesWidget({
    Key? key,
    required this.devicesname,
    required this.devicesicon,
    required this.power,
    required this.onChanged,
  }) : super(key: key);

  final String devicesname;
  final String devicesicon;
  final bool power;
  void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: (power==false)? Colors.blue[100]:Colors.red, borderRadius: BorderRadius.circular(12)),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Image.asset(
                  devicesicon, color: (power==false)? Colors.black:Colors.white,
                ),
                height: 65,
                width: 65,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(devicesname,
                        style: txt16!.copyWith(
                          color: (power==false)? Colors.black:Colors.white,
                        )),
                  ),
                  Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                        value: power,
                        onChanged: onChanged,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Transform.rotate(angle: pi/2,
// child: CupertinoSwitch(value: power, onChanged: onChanged,)),
