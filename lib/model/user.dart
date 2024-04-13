import 'package:melodica/model/db/banco.dart';

class User {
  String username;
  String password;
  String ultimoLogin;

  User(this.username, this.password, this.ultimoLogin);

  Future<int> insereUsuario() async {
    final db = await Banco.instance.database;
    try {
      return await db.rawInsert('''INSERT OR REPLACE INTO user (
        username, password, ultimoLogin) VALUES (?, ?, ?)
      ''', [username, password, ultimoLogin]);
    } catch (e) {
      print('Error inserting user: $e');
      return -1; // Return a specific error code or handle the error accordingly
    }
  }

  static Future<User?> verificaUsuario() async {
    final db = await Banco.instance.database;
    try {
      List<Map<String, Object?>> lista = await db.rawQuery('SELECT * FROM user');
      if (lista.isNotEmpty) {
        Map<String, Object?> utemp = lista.first;
        User user = User(
            utemp['username'].toString(), utemp['password'].toString(), utemp['ultimoLogin'].toString());
        return user;
      }
      return null;
    } catch (e) {
      return null; 
    }
  }

  Future<int> removeUsuario() async {
    final db = await Banco.instance.database;
    try {
      return await db.rawDelete("""DELETE FROM user WHERE username = ? """, [username]);
    } catch (e) {
      return -1; 
    }
  }
}
