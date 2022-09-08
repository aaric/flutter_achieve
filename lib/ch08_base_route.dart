import 'package:flutter/material.dart';
import 'page/NewPage.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  var _orderId = '20220908001';
  var _payAmount = '￥ 0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Goods: Ice Cream'),
            Text('Paid: $_payAmount'),
            ElevatedButton(onPressed: () async {
              var payAmount = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return NewPage(orderId: _orderId);
                  }
              ));
              setState(() {
                _payAmount = payAmount;
              });
            }, child: Text('To pay'))
          ]
        )
      )
    );
  }
}
