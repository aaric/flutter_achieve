/// 引导页面
///
/// @author Aaric, created on 2019-05-23T15:50.
/// @since 1.1.0-SNAPSHOT
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<StatefulWidget> {

  @override
  void initState() {
    super.initState();
    
    // Skip to app page
    Future.delayed(Duration(seconds: 3), () {
      print('Skip to app page...');
      Navigator.of(context).popAndPushNamed('/app');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/default_qrcode.png')
          ],
        ),
      ),
    );
  }
}
