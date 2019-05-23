import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './app_page.dart';
import './loading_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仿微信聊天',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: <String, WidgetBuilder> {
        '/app': (BuildContext context) => AppPage(),
        '/website': (_) => WebviewScaffold(
          url: 'https://www.so.com',
          appBar: AppBar(
            title: Text('浏览器'),
          ),
          //withZoom: true,
          withLocalStorage: true,
        ),
      },
      home: LoadingPage(),
    );
  }
}
