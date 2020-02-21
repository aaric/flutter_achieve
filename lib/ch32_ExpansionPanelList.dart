import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _msgList;
  List<bool> _msgIsExpandedList; //可以和_msgList封装在一起

  @override
  void initState() {
    super.initState();

    _msgList = List<int>();
    _msgIsExpandedList = List<bool>();
    for(var i = 0; i < 10; i++) {
      _msgList.add(i);
      _msgIsExpandedList.add(false);
    }
  }

  void toggleExpanded(int panelIndex, bool isExpanded) {
    setState(() {
      _msgIsExpandedList[panelIndex] = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ch32-ExpansionPanelList'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              // 设置展开闭合状态
              toggleExpanded(panelIndex, isExpanded);
            },
            children: _msgList.map((index) {
              return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('Msg-$index'),
                  );
                },
                body: ListTile(
                  title: Text('Content-$index'),
                ),
                isExpanded: _msgIsExpandedList[index]
              );
            }).toList()
          ),
        )
      ),
    );
  }
}
