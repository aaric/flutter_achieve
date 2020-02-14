import 'package:flutter/material.dart';
import 'my_font.dart';
import 'pages/airplane_page.dart';
import 'pages/train_page.dart';
import 'pages/bus_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  var _pageList = [
    BusPage(),
    TrainPage(),
    AirplanePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ch18-TabBar'),
          actions: <Widget>[
            IconButton(
              icon: Icon(MyFont.huawei),
              onPressed: () {
                print('huawei');
              },
            )
          ],
        ),
        body: _pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus),
                title: Text('bus')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.train),
                title: Text('train')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_airport),
                title: Text('airplane')
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'add',
        onPressed: () {
          print('FloatingActionButton clicked');
        },
      ),
    );
  }
}
