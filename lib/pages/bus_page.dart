import 'package:flutter/material.dart';

class BusPage extends StatefulWidget {
  @override
  _BusPageState createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> with SingleTickerProviderStateMixin {
  var _tabNameList = ['劳斯莱斯', '特拉斯', '悍马'];
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabNameList.length,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          child: TabBar(
            controller: _tabController,
            tabs: _tabNameList.map((e) => Tab(text: e)).toList()
          )
        ),
        Container(
          height: 400,
          child: TabBarView(
            controller: _tabController,
            children: _tabNameList.map((e) => Text('$e 的内容')).toList()
          )
        )
      ],
    );
  }
}

