import 'package:flutter/material.dart';
import 'package:melodica/view/home_page.dart';
import 'package:melodica/view/modules_list.dart';
import 'package:melodica/view/profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List<Widget> _screens = [
    const HomePage(),
    const ModulesList(),
    const Profile(),
  ];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: const Color(0xFFEA5353),
        indicatorColor: const Color.fromARGB(0, 234, 150, 150),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon:
                  Icon(Icons.home_outlined, color: Color(0xFF4f1b4b), size: 32),
              icon: Icon(Icons.home_outlined, color: Colors.white, size: 32),
              label: "Home"),
          NavigationDestination(
              selectedIcon: Icon(Icons.format_list_bulleted,
                  color: Color(0xFF4F1B4B), size: 32),
              icon: Icon(Icons.format_list_bulleted,
                  color: Colors.white, size: 32),
              label: "Modules"),
          NavigationDestination(
              selectedIcon: Icon(Icons.person_outlined,
                  color: Color(0xFF4F1B4B), size: 32),
              icon: Icon(Icons.person_outlined, color: Colors.white, size: 32),
              label: "Profile"),
        ],
      ),
      body: _screens[currentPageIndex],
      backgroundColor: const Color(0xffF8F3F3),
    );
  }
}
