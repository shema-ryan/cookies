
import 'dart:async';
import 'dart:io';
import 'form.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper{
  static DbHelper _dbHelper ;
  static Database _database ;

  String loginTable = 'login' ;
  String colId = 'id' ;
  String colName = 'username';
  String colPassWord = 'password';

  DbHelper._createInstance();

  factory DbHelper(){
    if(_dbHelper == null){
      _dbHelper = DbHelper._createInstance();  // creation of singleton object
    }
    return _dbHelper ;
  }

  Future<Database> get database async {
    if (_database == null){
      _database = await initializeDatabase() ;  // creation of singleton database
    }
    return _database ;
  }

  Future<Database>initializeDatabase()async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cookies.db';
   var hdatabase =  await openDatabase(path , version:1 , onCreate:_createDb) ;
   return hdatabase ;
  }

  void _createDb(Database db , int newVersion) async{
    await db.execute('CREATE TABLE $loginTable($colId INTEGER PRIMARY KEY AUTOINCREMENT , $colName TEXT , $colPassWord TEXT)');
  }

  Future<List<Map<String , dynamic>>>getFormMapList() async{
    Database db = await this.database ;
    var result= db.query(loginTable , orderBy : '$colId');
    return result ;
  }


  Future<int> insertFormList (FormInput formInput) async{
    Database db = await this.database ;
    var result = await db.insert(loginTable , formInput.toMap());
    return result;
  }

  Future<List<FormInput>>getFormList()async{
    var formMapList = await getFormMapList() ;
    int count = formMapList.length ;
    List<FormInput>formList = List<FormInput>();
    for(int i = 0 ; i < count ; i++){
      formList.add(FormInput.fromObject(formMapList[i]));
    }

    return formList ;
  }
}



