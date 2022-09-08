import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(
        title: Text('Order Id: ${widget.orderId}')
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
