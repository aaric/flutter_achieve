import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

// import 'ch01_hello_word.dart';
// import 'ch02_base_image.dart';
// import 'ch03_base_info.dart';
// import 'ex01_css_colors.dart';
// import 'ex02_fluttertoast.dart';
// import 'ex03_url_launcher.dart';
// import 'ex04_mqtt_client.dart';
// import 'ex05_device_info_plus.dart';
import 'ex06_wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        primarySwatch: Colors.blue
      ),
      home: const DemoPage(title: 'Flutter Demo Home Page')
    );
  }
}
