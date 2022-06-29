import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<IconData> _iconList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      // body: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      //   children: [
      //     Icon(Icons.ac_unit),
      //     Icon(Icons.ac_unit),
      //     Icon(Icons.ac_unit),
      //     Icon(Icons.ac_unit),
      //     Icon(Icons.ac_unit),
      //     Icon(Icons.ac_unit)
      //   ]
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0
        ),
        itemCount: _iconList.length,
        itemBuilder: (context, index) {
          if (index == _iconList.length - 1 && 25 > _iconList.length) {
            _receiveIconList();
          }
          return Icon(_iconList[index]);
        }
      )
    );
  }


  @override
  void initState() {
    super.initState();
    _receiveIconList();
  }

  void _receiveIconList() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _iconList.addAll([
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
          Icons.ac_unit,
        ]);
      });
    });
  }
}
