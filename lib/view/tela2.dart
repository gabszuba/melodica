import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFEA5353),
          title: const Text('Cadastre-se'),
        ),
    );
  }
}
