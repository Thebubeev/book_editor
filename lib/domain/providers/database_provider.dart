import 'package:book_editor/data/models/places_dao.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Объект класса обеспечивает доступ к библиотеке базы данных SQlite. 
class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider();
  static final _instance = DatabaseProvider._internal();

// Статичная переменная, которая  определяет базу данных как статичный тип.
  static DatabaseProvider staticDataBase = _instance;

// Буллевый тип данных, который сигнализирует о инициализации базы данных. 
  bool isInitialized = false;
  late Database _db;


  DatabaseProvider._internal();

/* 
Процедура db возвращает объект базы данных,
в случае его отсутствия, будет вызвана процедура _init.
*/
  Future<Database> db() async {
    if (!isInitialized) await _init();
    return _db;
  }

/*
Процедура _init создавает таблицу в базе данных на устройстве 
пользователя. Процедура _init будет использовать запрос SQL.  
*/
  Future _init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "book_editor.db");

    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(PlacesDao().createTableQuery);
    });
  }
}
