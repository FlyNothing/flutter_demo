// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_demo/plugin/sqlite/sqflite/const/common_const.dart';
import 'package:flutter_demo/plugin/sqlite/sqflite/entity/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  late Database _db;

  factory UserDao() => _instance;
  static final UserDao _instance = UserDao._internal();
  UserDao._internal(); // 构造方法私有

  Future<void> open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbUser);
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tableUser (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT not null,
            $columnAge INTEGER,
            $columnAddr TEXT
            )
        ''');
    });
  }

  Future<int> insert(User user) async {
    return await _db.insert(tableUser, user.toMap());
  }

  Future<int> insertRaw(User user) async {
    return await _db.rawInsert("INSERT INTO $tableUser('$columnName', '$columnAge', '$columnAddr') VALUES('${user.name}', '${user.age}', '${user.addr}')");
  }

  Future<List<User>> getAll() async {
    List<Map<String, Object?>> resList = await _db.query(tableUser);
    return List.generate(resList.length, (index) => resMapToUser(resList[index]));
  }

  Future<int> deleteById(int id) async {
    return await _db.delete(tableUser, where: "id = ?", whereArgs: [id]);
  }

  User resMapToUser(Map<String, Object?> resMap) {
    Object? age = resMap[columnAge];
    Object? addr = resMap[columnAddr];
    return User(
      id: resMap[columnId] as int,
      name: resMap[columnName] as String,
      age: age != null ? age as int : 0,
      addr: addr != null ? addr as String : "",
    );
  }
}
