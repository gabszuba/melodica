import 'package:flutter/material.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F3F3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seja bem-vindo',
              style: TextStyle(color: Color(0xFFEA5353), fontSize: 20),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFFEA5353),
                textStyle: const TextStyle(
                    fontSize: 16, fontFamily: 'Hammersmith One'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Color(0xFFEA5353), width: 1),
                ),
                minimumSize: const Size(120, 40),
              ),
              onPressed: () async {
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
