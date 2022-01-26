import 'package:local_notifaiction/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print('creating a new one');
        return db.execute(
          "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "name TEXT, note TEXT, date TEXT, "
          "issueNumber TEXT, issue TEXT, "
          "color INTEGER, "
          "phoneNu INTEGER, "
          "isCompleted INTEGER)",
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<int> insert(Issue? issue) async {
    print('insert function called');
    return await _db?.insert(_tableName, issue!.toJson()) ?? 1;
  }

  // static Future<List<Map<String, dynamic>>> query() async {
  //   print('query function called');
  //   return await _db!.query(_tableName);
  // }

  Future<List<Issue>> query() async {
    var result = await _db!.query(_tableName);
    List<Issue>? list;
    if (result.isNotEmpty) {
      list = result.map((e) => Issue.fromJson(e)).cast<Issue>().toList();
    } else {
      list = [];
    }
    return list;
  }

  static delete(Issue issue) async {
    print('delete function called');
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [issue.id]);
  }

  static update(int id) async {
    print('update function called');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id =?
   ''', [1, id]);
  }

  static  Future<dynamic> updateIssue(Issue issue) async {
    print('update function called');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET name = ?, note = ?, date = ?, issueNumber = ?, issue = ?, phoneNu = ?
    WHERE id =?
   ''', [
      issue.name!,
      issue.note!,
      issue.date!,
      issue.issueNumber!,
      issue.issue!,
      issue.phoneNu!,
      issue.id!
    ]);
  }

  //   _update() async {

  //   // get a reference to the database
  //   // because this is an expensive operation we use async and await
  //   Database db = await DatabaseHelper.instance.database;

  //   // row to update
  //   Map<String, dynamic> row = {
  //     DatabaseHelper.columnName : 'Mary',
  //     DatabaseHelper.columnAge  : 32
  //   };

  //   // We'll update the first row just as an example
  //   int id = 1;

  //   // do the update and get the number of affected rows
  //   int updateCount = await db.update(
  //       DatabaseHelper.table,
  //       row,
  //       where: '${DatabaseHelper.columnId} = ?',
  //       whereArgs: [id]);

  //   // show the results: print all rows in the db
  //   print(await db.query(DatabaseHelper.table));
  // }
}
