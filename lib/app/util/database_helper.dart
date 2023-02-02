import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'fokusApp.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDb;
  }

  _onCreate(Database db, int ver) async {
    await db.execute(
        '''CREATE TABLE user(id INTEGER PRIMARY KEY, userName TEXT NOT NULL)''');
    await db.execute("INSERT INTO user (id, userName) VALUES (0, 'default')");
  }

  Future<void> updateUserName(String userName) async {
    final database = await db;
    await database!.execute(
      "UPDATE user SET userName = '$userName' WHERE id = 0",
    );
  }

  Future<List<Map<String, dynamic>>> getUser() async {
    final Database? db = await this.db;
    final List<Map<String, dynamic>>? results = await db?.query('user');
    return Future.value(results);
  }
}
