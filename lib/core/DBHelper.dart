import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initializeDB();
    return _db;
  }

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Auth(id INTEGER PRIMARY KEY, token TEXT, cpf TEXT )",
        );
      },
      version: 1,
    );
  }

  Future saveToken(String token, String cpf) async {
    var dbClient = await db;
    await dbClient?.transaction((txn) async {
      await txn.rawInsert("DELETE FROM Auth");
      return await txn.rawInsert("INSERT INTO Auth(token, cpf) VALUES('" +
          token +
          "', '" +
          cpf +
          "')");
    });
  }

  Future removeToken() async {
    var dbClient = await db;
    await dbClient?.transaction((txn) async {
      return await txn.rawInsert("DELETE FROM Auth");
    });
  }

  Future<String> getToken() async {
    var dbClient = await db;
    List<Map> list =
        (await dbClient?.rawQuery('SELECT * FROM Auth'))!.cast<Map>();
    print(list);
    String token = list[0] as String;
    return token;
  }
}
