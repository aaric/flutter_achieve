/// 主页面
///
/// @author Aaric, created on 2019-05-23T15:10.
/// @since 1.1.0-SNAPSHOT
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('${widget.title}'),
      ),
    );
  }
}
