import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 52.0),
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFEA5353)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'logo.svg',
              semanticsLabel: 'Logo do Melodica',
              width: 80,
            ),
            const SizedBox(height: 10),
            const Text('MELODICA',
                style: TextStyle(color: Colors.white, fontSize: 40.0)),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(248, 52),
                backgroundColor: const Color(0xFF02002F),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Hammersmith One",
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(120, 44),
              ),
              child: const Text('Comece agora'),
            )
          ],
        ),
      ),
    );
  }
}
