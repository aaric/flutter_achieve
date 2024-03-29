import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:window_size/window_size.dart';
import 'package:wakelock/wakelock.dart';

// import 'ch01_hello_word.dart';
// import 'ch02_base_image.dart';
// import 'ch03_base_info.dart';
// import 'ch04_base_font.dart';
// import 'ch05_base_layout.dart';
// import 'ch06_base_widget.dart';
// import 'ch07_base_json.dart';
import 'page/NewPage.dart';
import 'ch08_base_route.dart';
// import 'ex01_css_colors.dart';
// import 'ex02_fluttertoast.dart';
// import 'ex03_url_launcher.dart';
// import 'ex04_mqtt_client.dart';
// import 'ex05_device_info_plus.dart';
// import 'ex06_wakelock.dart';
// import 'ex07_shared_preferences.dart';
// import 'ex08_file_picker.dart';
// import 'ex09_ftpconnect.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
  //   setWindowTitle('Flutter小例子');
  // }

  Wakelock.enable();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Fira Code'
      ),
      // home: const DemoPage(title: 'Flutter Demo Home Page')
      initialRoute: '/',
      routes: {
        '/' : (context) => DemoPage(title: 'Flutter Demo Home Page'),
        '/new_page' : (context) => NewPage(orderId: ModalRoute.of(context)!.settings.arguments as String)
      }
    );
  }
}
