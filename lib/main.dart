import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './app_page.dart';
import './loading_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var appName = '仿微信聊天';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: <String, WidgetBuilder> {
        '/app': (BuildContext context) => AppPage(title: appName),
        '/links': (_) => WebviewScaffold(
          url: 'https://www.so.com/',
          appBar: AppBar(
            title: Text('360搜索'),
          ),
          withZoom: true,
          withLocalStorage: true,
        ),
      },
      home: LoadingPage(),
    );
  }
}
