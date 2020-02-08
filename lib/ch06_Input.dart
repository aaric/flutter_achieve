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
  /*var _passwordController = TextEditingController();*/
  var _formKey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*_passwordController.addListener(() {
      print(_passwordController.text);
    });*/

    return Scaffold(
        appBar: AppBar(
          title: Text('ch06-Input'),
        ),
        body: Column(
          children: <Widget>[
            /*TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: '姓名',
                hintText: '请输入姓名',
                prefixIcon: Icon(Icons.person)
              ),
              keyboardType: TextInputType.text,
              onChanged: (val) {
                print(val);
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: '口令',
                  hintText: '请输入口令',
                  prefixIcon: Icon(Icons.lock)
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: _passwordController,
            )*/
            Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: _usernameController,
                    decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '请输入用户名',
                        prefixIcon: Icon(Icons.person)
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      return val.trim().length > 6? null : '请输入用户名';
                    },
                  ),
                  RaisedButton(
                    child: Text('提交'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print('提交成功：' + _usernameController.text);
                      }
                    },
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
