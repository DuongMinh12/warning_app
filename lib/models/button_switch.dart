// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class ButtonSwitch{
//   final String id;
//   bool? onPower = false;
//
//   ButtonSwitch({required this.id, this.onPower});
//
//   factory ButtonSwitch.fromMap(Map<String, dynamic> json)=>new ButtonSwitch(id: json['id'],
//   onPower: json['onPower']);
//
//   Map<String, dynamic> toMap(){
//     return {'id': id, 'onPower': onPower};
//   }
// }
//
// class DatabaseHelper{
//   DatabaseHelper._privateContructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateContructor();
//   static Database? _database;
//   Future<Database> get database async => _database ??= await _initDatabase();
//
//   Future<Database>_initDatabase()async{
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path,'buttonSwitch.db');
//     return await openDatabase(path,
//     version: 1,
//     onCreate: _onCreate);
//   }
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE  buttonSwitch(
//     id INTEGER PRIMARY KEY,
//     onPower BOOLEAN)''');
//   }
//
//   Future<List<ButtonSwitch>> getButtonSwitch() async {
//     Database db = await instance.database;
//     var buttonSwitch = await db.query('buttonSwitch', orderBy: 'onPower');
//     List<ButtonSwitch> buttonSwitchList = buttonSwitch.isNotEmpty? buttonSwitch.map((e) => ButtonSwitch.fromMap(e)).toList():[];
//     return buttonSwitchList;
//   }
// }