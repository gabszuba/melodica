import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Banco {
  static final Banco instance = Banco._();
  static Database? _database;

  Banco._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "meu_banco.db");
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE user (
        username TEXT PRIMARY KEY,
        password TEXT,
        ultimo_login TEXT
      )''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute("ALTER TABLE user ADD COLUMN ultimo_login TEXT");
    }
  }

  Future<void> close() async {
    final db = await database;
    db.close();
    _database = null; 
  }
}
