import 'package:melodica/model/User.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String status = '';

  @override
  void initState() {
    super.initState();
    print("oi");
    User.verificaUsuario().then((value) {
      if (value != null) Navigator.pushNamed(context, '/tela');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5EFEF),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 310,
            height: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF8F3F3),
              border: Border.all(
                color: const Color(0xFFEA5353),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 38, color: Color(0xFFEA5353)),
                ),
                const SizedBox(height: 40),
                TextField(
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Usuário',
                    filled: true,
                    fillColor: const Color(0xFFF0F0F0),
                    hintStyle:
                        const TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      color: Color(0xFFEA5353),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide:
                          const BorderSide(color: Color(0xFF8A8A8A), width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  style: const TextStyle(fontSize: 16),
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Senha',
                    filled: true,
                    fillColor: const Color(0xFFF0F0F0),
                    hintStyle:
                        const TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFFEA5353),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide:
                          const BorderSide(color: Color(0xFF8A8A8A), width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFEA5353),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFEA5353),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  status,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 17, 0), fontSize: 16),
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEA5353),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 16, fontFamily: 'Hammersmith One'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 40),
                  ),
                  onPressed: () {
                    String username = userController.text;
                    String password = passwordController.text;
                    String dataFormatada = DateFormat('dd-MM-yyyy - kk:mm').format(DateTime.now());
                    User newUser = User(username, password, dataFormatada);
                    // ignore: avoid_print
                    print(newUser);
                  },
                  child: const Text('Entrar'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFEA5353),
                    textStyle: const TextStyle(
                        fontSize: 16, fontFamily: 'Hammersmith One'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side:
                          const BorderSide(color: Color(0xFFEA5353), width: 1),
                    ),
                    minimumSize: const Size(120, 40),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/tela2');
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
          Positioned(
            top: -50,
            child: _icon(),
          ),
        ],
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffea5353),
      ),
      width: 100,
      child: const Image(image: AssetImage('assets/logo.png')),
    );
  }
}
