import 'package:flutter/material.dart';
import 'package:melodica/view/bottom_bar.dart';
import 'package:melodica/view/lessons_list.dart';
import 'package:melodica/view/login.dart';
import 'package:melodica/view/modules_list.dart';
import 'package:melodica/view/profile.dart';
import 'package:melodica/view/settings.dart';
import 'package:melodica/view/signup.dart';
import 'package:melodica/view/welcome.dart';

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
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/profile': (context) => const Profile(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const BottomBar(),
        '/modules': (context) => const ModulesList(),
        '/classes': (context) => const LessonsList(),
        '/setting': (context) => const Settings(),
      },
    );
  }
}
