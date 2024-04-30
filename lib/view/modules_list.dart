import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ModulesList extends StatefulWidget {
  const ModulesList({super.key});

  @override
  State<ModulesList> createState() => _ModulesListState();
}

class _ModulesListState extends State<ModulesList>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Container(
          height: 200,
          child: Stack(
            children: [_bgBar(), _topBarContent()],
          )),
    );
  }

  Widget _topBarContent() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Cursos",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabBar(
              labelStyle:
                  TextStyle(fontSize: 16, fontFamily: 'Hammersmith One'),
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xFFFFE0E0),
              dividerColor: Colors.transparent,
              indicatorColor: Colors.white,
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  text: 'Teoria Musical',
                ),
                Tab(
                  text: 'Instrumentos',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bgBar() {
    const String assetName = 'assets/blob-background.svg';
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SvgPicture.asset(
        assetName,
        fit: BoxFit.fill,
        semanticsLabel: 'Background Bar',
      ),
    );
  }
}
