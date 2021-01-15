import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper with ChangeNotifier {
  static final tableName = 'bookmarktable';

    DBHelper() {
    // this will run when provider is instantiate the first time
    init();
  }
  sql.Database db;
  void init() async {
    final dbPath = await sql.getDatabasesPath();
    db = await sql.openDatabase(
      path.join(dbPath, 'favourite.db'),
      onCreate: (db, version) {
        final stmt = '''CREATE TABLE IF NOT EXISTS $tableName (
            id INT,
            title TEXT,
            code TEXT,
            imageurl TEXT,
            linksite TEXT
        )'''
            .trim()
            .replaceAll(RegExp(r'[\s]{2,}'), ' ');
        return db.execute(stmt);
      },
      version: 1,
    );
    notifyListeners();
  }

  Future<void> insert(String table, Map<String, Object> data) async {
    await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
Future<void> deleteCoupon(int id) async{
   await db.delete('bookmarktable', where: 'id = ?', whereArgs: [id]);
  }
  Future<List<Map<String, dynamic>>> getData(String table) async {
    return await db.query(table);
  }
}
