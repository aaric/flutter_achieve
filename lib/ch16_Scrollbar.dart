import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ch16-Scrollbar'),
      ),
      /* body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            height: 3000,
            color: Colors.red,
            child: Text('Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptatibus doloremque ut at itaque asperiores adipisci ducimus mollitia voluptatem aspernatur eos, vitae voluptate aliquid rem beatae, atque praesentium dicta velit fuga.'),
          )
        ),
      ), */
      /* body: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: 50,
              itemExtent: 50, //强制指定子控件高度范围
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('hello world')
                );
              }
            )
          )
        ],
      ), */
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2 //子元素宽高比，width/height=2/1
        ),
        children: <Widget>[
          Text('g1'),
          Text('g2'),
          Text('g3'),
          Text('g4'),
          Text('g5'),
          Text('g6'),
          Text('g7'),
          Text('g8'),
          Text('g9'),
        ],
      ),
    );
  }
}
