import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';

class LessonsList extends StatefulWidget {
  const LessonsList({super.key});

  @override
  State<LessonsList> createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EFEF),
      ),
      backgroundColor: const Color(0xFFF5EFEF),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _body(),
            _buildCard('assets/violao.svg', '01 - Introdução', 0.5)
          ],
        ),
      )
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: SizedBox(
              height: 144,
              width: 144,
              child: SvgPicture.asset('assets/violao.svg', semanticsLabel: 'Violao')
            )
          ),
          Positioned(
            width: 270,
            left: 0,
            child: SizedBox(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Título do Módulo',
                    style: TextStyle(color: Color(0xFF02002F), fontSize: 24),
                  ),
                  const SizedBox(height: 6),
                  const Text('Descrição do módulo',
                      style: TextStyle(
                          color: Color.fromRGBO(88, 86, 119, 1),
                          fontSize: 12)),
                  const SizedBox(height: 16),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.access_alarm_rounded, color: Color(0xFF02002F), size: 18),
                      SizedBox(width: 4,),
                      Text('1h 35min', style: TextStyle( color: Color.fromRGBO(88, 86, 119, 1), fontSize: 10)
                      ),
                    ]
                  ),
                  const SizedBox( height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF02002F),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(100, 40),
                    ),
                    onPressed: () => {},
                    child: const Text('Continuar', style: TextStyle(fontFamily: 'Hammersmith One', fontSize: 14)),

                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _buildCard(
      String svg, String title,  double progress) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
              children: <Widget>[
                SizedBox(width: 60, height: 60, child: SvgPicture.asset(svg),),
                const SizedBox(width: 6,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(color: Color(0xFF030047), fontSize: 16)),
                      const SizedBox(height: 4),
                      GFProgressBar(
                        percentage: progress,
                        lineHeight: 12,
                        alignment: MainAxisAlignment.spaceBetween,
                        backgroundColor: Colors.black12,
                        progressBarColor: const Color(0xFF030047),
                        child: Text(
                          '${(progress * 100).toInt()}%',
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 9, color: Color(0xFF030047)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}