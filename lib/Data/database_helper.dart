import 'dart:io';

import 'package:gstock/Models/Admin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper{
  DataBaseHelper._privateConstructor();
  static final DataBaseHelperinstance = DataBaseHelper._privateConstructor();
  static Database? _database;

  final _databaseName='gStock';

  Future<Database> get database async =>_database??=await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path,_databaseName);


    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db,int version) async{
    await db.execute('''
      CREATE TABLE admin(
        id integer PRIMARY KEY autoincrement,
        nom TEXT,
        prenom TEXT,
        email TEXT,
        mdp TEXT
      )
     ''');
    await db.execute('''
      CREATE TABLE famille(
       id integer PRIMARY KEY autoincrement,
        des TEXT,
        description TEXT
      )
     ''');
    await db.execute('''
      CREATE TABLE composant(
        id TEXT PRIMARY KEY,
        des TEXT,
        description TEXT,
        qte INTEGER,
        famille_comp,
        FOREIGN KEY(famille_comp) REFERENCES famille(id)
      )
     ''');

  }
}