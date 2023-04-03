import 'package:rive/rive.dart';
import 'package:warning_app/constants/add_all.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  RiveAsset({required this.artboard,
    required this.title,
    required this.src,
    required this.stateMachineName,
    this.input});

  set setInput(SMIBool status){
      input = status;
  }
}

List<RiveAsset> sideMenu =[
  RiveAsset(artboard: 'HOME', stateMachineName: 'HOME_interactivity', title: 'HOME', src: iconrive
  ),
];
