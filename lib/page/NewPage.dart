import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key, required this.orderId});

  final String orderId;

  @override
  State<StatefulWidget> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {

  var _amount = '￥ 10.00';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(
            title: Text('Order Id: $args')
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Amount: $_amount'),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context, _amount);
                  }, child: Text('Paid'))
                ]
            )
        )
    );
  }
}
