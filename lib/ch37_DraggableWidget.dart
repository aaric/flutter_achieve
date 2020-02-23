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
  Color _dragColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final offsetWidth = (screenWidth - 200) / 2;
    final offsetHeight = 100.0;

    return Scaffold(
      /*appBar: AppBar(
        title: Text('ch37-DraggableWidget'),
      ),*/
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(offsetWidth, offsetHeight),
            color: Colors.green,
          ),
          DraggableWidget(
            offset: Offset(offsetWidth + 100, offsetHeight),
            color: Colors.red,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                _dragColor = color;
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: _dragColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color color;

  const DraggableWidget({Key key, this.offset, this.color}):super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.color,
        child: Container(
          width: 100,
          height: 100,
          color: widget.color,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.color.withOpacity(0.5),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
