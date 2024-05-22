import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Usuário',
              style: TextStyle(color: Color(0xFF02002F), fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text(
              'Estatísticas',
              style: TextStyle(color: Color(0xFFEA5353), fontSize: 20),
            ),
            const SizedBox(height: 4),
            _button('Configurações',
                () => {Navigator.pushNamed(context, '/setting')}),
            const SizedBox(height: 8),
            _button(
                'Sobre',
                () => {
                      showAboutDialog(
                          context: context, applicationVersion:  '1.0')
                    }),
            const SizedBox(height: 8),
            _button(
                'Sair',
                () =>
                    Navigator.popUntil(context, ModalRoute.withName('/login'))),
          ],
        ),
      ),
    );
  }

  Widget _button(text, callback) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.all(16),
      ),
      onPressed: callback,
      child: Text(text),
    );
  }
}
