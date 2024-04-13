import 'package:melodica/model/db/database.dart';
import 'package:uuid/uuid.dart';

class User {
  String? id;
  String username;
  String email;
  String password;
  String lastLogin;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.lastLogin,
  }) : id = generateUUID();

  Future<int> insertUser() async {
    final db = await DatabaseHelper.instance.database;
    try {
      return await db.rawInsert('''INSERT INTO user (
        id, username, email, password, last_login) VALUES (?, ?, ?, ?, ?)
      ''', [id, username, email, password, lastLogin]);
    } catch (e) {
      return -1;
    }
  }

  static Future<User?> verifyUser(int id) async {
    final db = await DatabaseHelper.instance.database;
    try {
      List<Map<String, Object?>> lista =
          await db.rawQuery('SELECT * FROM user WHERE id = ?', [id]);
      if (lista.isNotEmpty) {
        Map<String, Object?> utemp = lista.first;
        return User(
          username: utemp['username'].toString(),
          email: utemp['email'].toString(),
          password: utemp['password'].toString(),
          lastLogin: utemp['lastLogin'].toString(),
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

static Future<User?> logUser(String username, String password) async {
  final db = await DatabaseHelper.instance.database;
  try {
    Map<String, Object?>? userData = await db.rawQuery(
      'SELECT * FROM user WHERE username = ? AND password = ? LIMIT 1',
      [username, password],
    ).then((result) => result.isNotEmpty ? result.first : null);

    if (userData != null) {
      fetchAllUsers();
      return User(
        username: userData['username'].toString(),
        email: userData['email'].toString(),
        password: userData['password'].toString(),
        lastLogin: userData['lastLogin'].toString(),
      );
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

static void fetchAllUsers() async {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> users = await databaseHelper.getAllUsers();
  users.forEach((user) {
    print('User ID: ${user['id']}');
    print('Username: ${user['username']}');
    print('Email: ${user['email']}');
    print('Password: ${user['password']}');
    print('Last Login: ${user['last_login']}');
    print('--------------------------');
  });
}



  Future<int> removeUser() async {
    final db = await DatabaseHelper.instance.database;
    try {
      return await db.rawDelete('DELETE FROM user WHERE id = ?', [id]);
    } catch (e) {
      return -1;
    }
  }

  static String generateUUID() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}
