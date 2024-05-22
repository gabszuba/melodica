import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  final bool _newpasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EFEF),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF5EFEF)),
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          _personalInformation(),
          const SizedBox(height: 42),
          _changePassword(),
        ],
      ),
    );
  }

  Widget _personalInformation() {
    return Container(
      child: Column(children: [
        const Text(
          'Altere seus dados pessoais',
          style: TextStyle(color: Color(0xFF02002F), fontSize: 20),
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Nome de usuário',
            filled: true,
            fillColor: const Color(0xFFF0F0F0),
            hintStyle: const TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Color(0xFF8A8A8A), width: 1),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Email',
            filled: true,
            fillColor: const Color(0xFFF0F0F0),
            hintStyle: const TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Color(0xFF8A8A8A), width: 1),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 217, 217, 217),
              foregroundColor: const Color.fromARGB(255, 34, 34, 34),
              padding: const EdgeInsets.all(16),
            ),
            child: const Text(
              'Salvar alterações',
              style: TextStyle(fontSize: 12, fontFamily: 'Hammersmith One'),
            ),
            onPressed: () {},
          ),
        )
      ]),
    );
  }

  Widget _changePassword() {
    return Container(
      child: Column(children: [
        const Text(
          'Altere sua senha',
          style: TextStyle(color: Color(0xFF02002F), fontSize: 20),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _passwordController,
          validator: (val) =>
              val!.isEmpty ? 'Por favor digite sua senha atual.' : null,
          style: const TextStyle(fontSize: 16),
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Senha atual',
            filled: true,
            fillColor: const Color(0xFFF0F0F0),
            hintStyle: const TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
              borderSide: const BorderSide(color: Color(0xFF8A8A8A), width: 1),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _passwordController,
          validator: (val) =>
              val!.isEmpty ? 'Por favor digite sua nova senha.' : null,
          style: const TextStyle(fontSize: 16),
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Nova senha',
            filled: true,
            fillColor: const Color(0xFFF0F0F0),
            hintStyle: const TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
              borderSide: const BorderSide(color: Color(0xFF8A8A8A), width: 1),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 217, 217, 217),
              foregroundColor: const Color.fromARGB(255, 34, 34, 34),
              padding: const EdgeInsets.all(16),
            ),
            child: const Text(
              'Salvar alterações',
              style: TextStyle(fontSize: 12, fontFamily: 'Hammersmith One'),
            ),
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}
