import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static late Database _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'your_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Veritabanı tablolarını oluşturun ve diğer başlangıç işlemlerini yapın.
    await db.execute('''
      CREATE TABLE your_table (
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT
      )
    ''');
    // Diğer tabloları burada oluşturabilirsiniz.
  }

  // Veritabanı işlemleri için gerekli metodları ekleyin.
}

