import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EFEF),
      ),
      backgroundColor: const Color(0xFFF5EFEF),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 52, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Se cadastre',
                  style: TextStyle(fontSize: 38, color: Color(0xFFEA5353)),
                ),
                const SizedBox(height: 28),
                TextFormField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Username',
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    hintStyle:
                        TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
                    prefixIcon: Icon(
                      Icons.person_outline,
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
                TextFormField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    hintStyle:
                        TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
                    prefixIcon: Icon(
                      Icons.email_outlined,
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
                TextFormField(
                  controller: _passwordController,
                  validator: (val) =>
                      val!.isEmpty ? 'Por favor digite uma senha.' : null,
                  style: const TextStyle(fontSize: 16),
                  obscureText: !_passwordVisible,
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
                      borderSide:
                          const BorderSide(color: Color(0xFF8A8A8A), width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  obscureText: _confirmPasswordVisible,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Confirme sua senha',
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    hintStyle:
                        TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xFFEA5353),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide:
                          BorderSide(color: Color(0xFF8A8A8A), width: 1),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color.fromARGB(205, 28, 26, 26),
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmPasswordVisible = !_confirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEA5353),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 16, fontFamily: 'Hammersmith One'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side:
                          const BorderSide(color: Color(0xFFEA5353), width: 1),
                    ),
                    minimumSize: const Size(150, 40),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // validar o form e passar pra tela inicial
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          )),
    );
  }
}
