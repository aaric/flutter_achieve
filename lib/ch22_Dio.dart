import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
  var _entities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ch22-Dio'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('FlatButton'),
              onPressed: () async {
                var dio = Dio();
                //Response html = await dio.get('https://www.baidu.com');
                Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');
                //List list = response.data;
                //list.forEach((e) { print('${e["title"]}'); });
                setState(() {
                  _entities = response.data;
                });
              },
            ),
            Container(
                height: 400,
                child: /*ListView(
                children: _entities.map((e) => ListTile(title: Text(e['title']))).toList()
              ),*/
                ListView.builder(
                    itemCount: _entities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.edit),
                        ),
                        title: Text(_entities[index]['title']),
                        subtitle: Text(_entities[index]['body']),
                        isThreeLine: true,
                      );
                    }
                )
            )
          ],
        )
    );
  }
}
