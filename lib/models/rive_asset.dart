import 'package:rive/rive.dart';
import 'package:warning_app/constants/add_all.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  RiveAsset(this.src, {required this.artboard,
    required this.title,
    required this.stateMachineName,
    this.input});

  set setInput(SMIBool status){
      input = status;
  }
}

List<RiveAsset> sideMenu =[
  RiveAsset(artboard: 'HOME', stateMachineName: 'HOME_interactivity', title: 'Home', iconrive),
  RiveAsset(artboard: 'USER', stateMachineName: 'USER_Interactivity', title: 'Profile', iconrive),
  RiveAsset(artboard: 'BELL', stateMachineName: 'BELL_Interactivity', title: 'Notification', iconrive),
  RiveAsset(artboard: 'CHAT', stateMachineName: 'CHAT_Interactivity', title: 'Help', iconrive),
];
