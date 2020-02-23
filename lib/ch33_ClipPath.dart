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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ch33-ClipPath'),
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BezierClipper(),
            child: Container(
              color: Colors.greenAccent,
              height: 200,
            ),
          )
        ],
      )
    );
  }
}

class BezierClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);

    var cp1 = Offset(size.width/4, size.height); //control point
    var ep1 = Offset(size.width/2.25, size.height - 30); //end point
    path.quadraticBezierTo(cp1.dx, cp1.dy, ep1.dx, ep1.dy);

    var cp2 = Offset(size.width/4*3, size.height-80); //control point
    var ep2 = Offset(size.width, size.height - 40); //end point
    path.quadraticBezierTo(cp2.dx, cp2.dy, ep2.dx, ep2.dy);
    
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}
