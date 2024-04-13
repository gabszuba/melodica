import 'package:melodica/view/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Melodica",
      theme: ThemeData(fontFamily: 'Hammersmith One'),
      routes: {
        '/': (context) => const Login(),
      },
    );
  }
}
