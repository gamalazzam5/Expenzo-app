import 'package:expenzo_app/models/expense_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'gamal.db');
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 3,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("onUpgrade =====================");
    // await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE "expenses" (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      amount REAL NOT NULL,
      date TEXT NOT NULL,
      category TEXT NOT NULL
    )
    ''');
    await batch.commit();
    print("onCreate =====================");
  }

  Future<List<Map<String, dynamic>>> read(String table) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.query(table);
    return response;
  }

  insert(String table, Map<String, dynamic> data) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table,data);
print("response ============ $response");
    return response;
  }

  update(String table, Map<String, Object?> values, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values, where: where);
    return response;
  }

  delete(String table, String? where) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: where);
    return response;
  }
  Future<void> deleteExpenseById(int id) async {
    await delete('expenses', 'id = $id');
  }
}
