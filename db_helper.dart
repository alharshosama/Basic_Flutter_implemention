import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
class DbTables{
  static const String Tests = "Tests";
  static const String Products = "Products";
}
String _testTbl = 'CREATE TABLE ${DbTables.Tests} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Details TEXT NULL)';
String _productsTbl = 'CREATE TABLE ${DbTables.Products} (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Price REAL, Img TEXT NULL, Details TEXT NULL)';


class DbHelper{
  static DbHelper? dbHelper;
  static Database?_database;
  DbHelper._createInstance();
  factory DbHelper(){
    dbHelper ??=DbHelper._createInstance();
    return dbHelper as DbHelper;
  }

  Future<Database> get database async {
    _database ??= await _initializeDatabase();
    return _database as Database;
  }

  void _createDatabaseV1(Database db, int version) async {
    try {
      await db.execute(_testTbl);
      await db.execute(_productsTbl);
    }
    catch(e){
      print("CreateExp:- "+ e.toString());
      rethrow;
    }
  }

  Future<Database> _initializeDatabase() async {
    int dbVersion =1;
   // var path=getDatabasesPath();
    final dbFolder = await getExternalStorageDirectory();
    final dbPath = p.join(dbFolder!.path, "Database");
    Directory dbFolderDir = await Directory(dbPath).create(recursive: true);

    final file = File(p.join(dbFolderDir.path, 'test.db'));
    var testDb = await openDatabase(
        file.path,
        version: dbVersion,
        onCreate: (db,version){
          db.execute(_testTbl);
          db.execute(_productsTbl);


        },
        onDowngrade: onDatabaseDowngradeDelete,
      //onUpgrade:
    );
    return testDb;
  }

  Future<int> addProduct(Map<String,dynamic>data)async{
    try{
      var db = await database;
      var res = db.insert(DbTables.Products, data);
      return res;

  }
  catch(e){
      return 0;
  }
    }
    Future<List<Map<String,dynamic>>> getProducts()async{
      var db = await database;
      var res = db.query(DbTables.Products,where: 'Id=? and Name=?',whereArgs:[1,"osama"]);
      return res;

    }

  getAll(String tests) {}

  add(String tests, Map<String, dynamic> obj) {}

}