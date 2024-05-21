import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

class MusicTheoryTab extends StatefulWidget {
  const MusicTheoryTab({super.key});

  @override
  State<MusicTheoryTab> createState() => _MusicTheoryTabState();
}

class _MusicTheoryTabState extends State<MusicTheoryTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _buildCard("Modulo I", "Título do Módulo", "Descrição", 0.7),
          SizedBox(height: 12),
          _buildCard("Modulo II", "Título do Módulo II", "Descrição II", 0.5),
          SizedBox(height: 12),
          _buildCard(
              "Modulo III", "Título do Módulo III", "Descrição III", 0.3),
          SizedBox(height: 12),
          _buildCard("Modulo IV", "Título do Módulo IV", "Descrição IV", 0.8),
        ],
      ),
    );
  }

  Widget _buildCard(
      String module, String title, String description, double progress) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/classes');
      },
      child: Card(
        color: Color(0xFFF2E2E7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(module,
                      style: TextStyle(color: Color(0xFFEA5353), fontSize: 14)),
                  SizedBox(height: 12),
                  Text(title,
                      style: TextStyle(color: Color(0xFF030047), fontSize: 20)),
                  Text(description,
                      style: TextStyle(color: Color(0xFF5B5B5B), fontSize: 12)),
                  SizedBox(height: 14),
                  GFProgressBar(
                    percentage: progress,
                    lineHeight: 12,
                    alignment: MainAxisAlignment.spaceBetween,
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 9, color: Color(0xFF030047)),
                    ),
                    backgroundColor: Colors.black12,
                    progressBarColor: Color(0xFF030047),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
