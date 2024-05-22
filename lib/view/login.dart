import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  int logoSize = 110;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFEF),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 320,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF8F3F3),
              border: Border.all(
                color: const Color(0xFFEA5353),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 38, color: Color(0xFFEA5353)),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _userController,
                    validator: (val) => val!.isEmpty
                        ? 'Por favor, digite um nome de usuário.'
                        : null,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Usuário',
                      filled: true,
                      fillColor: const Color(0xFFF0F0F0),
                      hintStyle: const TextStyle(
                          color: Color(0xFF8A8A8A), fontSize: 16),
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                        color: Color(0xFFEA5353),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: const BorderSide(
                            color: Color(0xFF8A8A8A), width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    validator: (val) =>
                        val!.isEmpty ? 'Por favor, digite sua senha.' : null,
                    style: const TextStyle(fontSize: 16),
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Senha',
                      filled: true,
                      fillColor: const Color(0xFFF0F0F0),
                      hintStyle: const TextStyle(
                          color: Color(0xFF8A8A8A), fontSize: 16),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xFFEA5353),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromARGB(205, 28, 26, 26),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: const BorderSide(
                            color: Color(0xFF8A8A8A), width: 1),
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
                      minimumSize: const Size(150, 40),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // String username = _userController.text;
                        // String password = _passwordController.text;
                        // User? loggedInUser =
                        //     await User.logUser(username, password);
                        // if (loggedInUser != null) {
                        //   print("Sucesso");
                          Navigator.pushNamed(context, '/home');
                        // } else {
                        //   print("Erro ao logar");
                        // }
                      }
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
                        side: const BorderSide(
                            color: Color(0xFFEA5353), width: 1),
                      ),
                      minimumSize: const Size(150, 40),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -(logoSize / 2),
            child: _icon(logoSize),
          ),
        ],
      ),
    );
  }

Widget _icon(logoSize) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xffea5353),
    ),
    width: logoSize, 
    height: logoSize,
    child: Center(
      child: SvgPicture.asset(
        'logo.svg',
        semanticsLabel: 'Logo do Melodica',
        width: 70, 
        height: 70, 
      ),
    ),
  );
}}
