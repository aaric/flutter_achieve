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
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('HomePage'),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_next,
            color: Colors.white,
            size: 64,
          ),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => MyNextPage()));
            Navigator.push(context, CustomPageRoute(MyNextPage()));
          },
        ),
      ),
    );
  }
}

class MyNextPage extends StatefulWidget {
  @override
  _MyNextPageState createState() => _MyNextPageState();
}

class _MyNextPageState extends State<MyNextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('NextPage'),
        elevation: 0.0,
        automaticallyImplyLeading: false, //隐藏返回按钮
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget widget;

  CustomPageRoute(this.widget): super(
    transitionDuration: Duration(seconds: 1),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      // 动画一：渐隐渐现效果
      /*return FadeTransition(
        opacity: Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn
        )),
        child: child,
      );*/
      // 动画二：缩放
      /*return ScaleTransition(
        scale: Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn
        )),
        child: child,
      );*/
      // 动画三：旋转
      /*return RotationTransition(
        turns: Tween(
          begin: 0.0,
          end: 1.0
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn
        )),
        child: child,
      );*/
      // 动画四：旋转+缩放
      /*return RotationTransition(
        turns: Tween(
            begin: 0.0,
            end: 1.0
        ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn
        )),
        child: ScaleTransition(
          scale: Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn
          )),
          child: child,
        ),
      );*/
      // 动画五：左右滑动
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0, 0.0),
          end: Offset(0.0, 0.0)
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn
        )),
        child: child,
      );
    }
  );

}

