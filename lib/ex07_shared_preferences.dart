import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _dataInt = 0;
  bool _dataBool = false;
  double _dataDouble = 0.0;
  String _dataString = '';
  List<String> _dataStringList = <String> [];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/shared_preferences
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('_dataInt: $_dataInt'),
            Text('_dataBool: $_dataBool'),
            Text('_dataDouble: $_dataDouble'),
            Text('_dataString: $_dataString'),
            Text('_dataStringList: ${_dataStringList.join(", ")}'),
            ElevatedButton(onPressed: _getData, child: const Text('get data')),
            ElevatedButton(onPressed: _setData, child: const Text('set data')),
            ElevatedButton(onPressed: _clearData, child: const Text('clear data'))
          ]
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _getData();

    counter = _dataInt;
  }

  void _getData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _dataInt = prefs.getInt("_dataInt") ?? 0;
      _dataBool = prefs.getBool("_dataBool") ?? false;
      _dataDouble = prefs.getDouble("_dataDouble") ?? 0.0;
      _dataString = prefs.getString("_dataString") ?? '';
      _dataStringList = prefs.getStringList("_dataStringList") ?? <String>[];
    });
  }

  void _setData() async {
    final SharedPreferences prefs = await _prefs;
    var flag = prefs.getBool("_dataBool") ?? false;
    var strList = prefs.getStringList("_dataStringList") ?? <String>[];

    counter += 1;
    strList.add('A$counter');

    await prefs.setInt("_dataInt", counter);
    await prefs.setBool("_dataBool", !flag);
    await prefs.setDouble("_dataDouble", 0.0 + counter);
    await prefs.setString("_dataString", "hello world $counter");
    await prefs.setStringList("_dataStringList", strList);

    _getData();
  }

  void _clearData() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove("_dataInt");
    await prefs.remove("_dataBool");
    await prefs.remove("_dataDouble");
    await prefs.remove("_dataString");
    await prefs.remove("_dataStringList");

    _getData();
  }
}
