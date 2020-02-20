import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: KeepAlivePage(),
    );
  }
}

class KeepAlivePage extends StatefulWidget {
  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage> with SingleTickerProviderStateMixin {
  var _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ch28-KeepAlive'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab( child: Icon(Icons.directions_run),),
            Tab( child: Icon(Icons.directions_bike),),
            Tab( child: Icon(Icons.directions_bus),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          VehiclePage(),
          VehiclePage(),
          VehiclePage(),
        ],
      ),
    );
  }
}

class VehiclePage extends StatefulWidget {
  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> with AutomaticKeepAliveClientMixin {
  var _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method overrides a method annotated as @mustCallSuper in 'AutomaticKeepAliveClientMixin'...
    super.build(context);

    return Scaffold(
      body: Center(
        child: Text('Current: $_counter',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Increment',
        onPressed: _incrementCounter,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

