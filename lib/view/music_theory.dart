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
      padding: const EdgeInsets.all(24),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _buildCard("Modulo I", "Título do Módulo", "Descrição", 0.7),
          const SizedBox(height: 12),
          _buildCard("Modulo II", "Título do Módulo II", "Descrição II", 0.5),
          const SizedBox(height: 12),
          _buildCard(
              "Modulo III", "Título do Módulo III", "Descrição III", 0.3),
          const SizedBox(height: 12),
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
        color: const Color(0xFFF2E2E7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(module,
                      style: const TextStyle(color: Color(0xFFEA5353), fontSize: 14)),
                  const SizedBox(height: 12),
                  Text(title,
                      style: const TextStyle(color: Color(0xFF030047), fontSize: 20)),
                  Text(description,
                      style: const TextStyle(color: Color(0xFF5B5B5B), fontSize: 12)),
                  const SizedBox(height: 14),
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
