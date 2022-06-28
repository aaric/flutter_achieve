import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  late SharedPreferences _prefs;
  int _dataInt = 0;
  bool _dataBool = false;
  double _dataDouble = 0.0;
  String _dataString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('_dataInt: ${_prefs?.getInt("_dataInt")??0}'),
            Text('_dataBool: $_dataBool'),
            Text('_dataDouble: $_dataDouble'),
            Text('_dataString: $_dataString'),
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
    initStateAsync();
  }

  void initStateAsync() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _getData() async {
    setState(() {
      _dataInt = _prefs?.getInt("_dataInt")??0;
      _dataBool = _prefs?.getBool("_dataBool")??false;
      _dataDouble = _prefs?.getDouble("_dataDouble")??0.0;
      _dataString = _prefs?.getString("_dataString")??'';
    });
  }

  void _setData() async {
    await _prefs?.setInt("_dataInt", 1);
    await _prefs?.setBool("_dataBool", true);
    await _prefs?.setDouble("_dataDouble", 1.0)??0.0;
    await _prefs?.setString("_dataString", "hello world");
  }

  void _clearData() async {
    await _prefs?.remove("_dataInt");
    await _prefs?.remove("_dataBool");
    await _prefs?.remove("_dataDouble");
    await _prefs?.remove("_dataString");
  }
}
