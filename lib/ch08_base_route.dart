import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

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
            Text('OrderId: 20220908001'),
            ElevatedButton(onPressed: () async {
              var payAmount = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return NewPage(orderId: '20220908001');
                  }
              ));
              print('pay amount: $payAmount');
            }, child: Text('pay money'))
          ]
        )
      )
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key, required this.orderId});

  final String orderId;

  @override
  State<StatefulWidget> createState() => _NewPageState();
}


class _NewPageState extends State<NewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Order Id: ${widget.orderId}')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Amount: ￥ 10.00'),
            ElevatedButton(onPressed: () {
              Navigator.pop(context, '￥ 10.00');
            }, child: Text('back result'))
          ]
        )
      )
    );
  }
}
