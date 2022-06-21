import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DemoPage());
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<DemoPage> {
  final _subTopic = '/msg/client/2';
  final _pubTopic = '/msg/server/default';
  MqttServerClient? _client;

  var stateText = 'disconnected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      /*Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Input'),
                onChanged: (content) => print(content)))
      ]),*/
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$stateText')]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: _connect, child: const Text('连接'))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: _subscribe, child: const Text('订阅'))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: _publish, child: const Text('发布'))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: _unsubscribe, child: const Text('取消订阅'))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(onPressed: _disconnect, child: const Text('断开连接'))
      ])
    ]));
  }

  Future<MqttServerClient> _connect() async {
    MqttServerClient client =
        MqttServerClient.withPort('10.0.11.21', 'msg-client-flutter', 1883);
    client.logging(on: true);
    client.onConnected = () => print('connected');
    client.onDisconnected = () => print('disconnected');
    client.onSubscribed = (topic) => print('subscribed: $topic');
    client.onSubscribeFail = (topic) => print('subscribed fail: $topic');
    client.onUnsubscribed = (topic) => print('subscribed: $topic');
    client.pongCallback = () => print('pong callbacked');

    final connMsg = MqttConnectMessage()
        // .authenticateAs('username', 'password')
        // .keepAliveFor(60)
        .withWillTopic('willTopic')
        .withWillMessage('willMessage')
        .startClean()
        .withWillQos(MqttQos.exactlyOnce);
    client.connectionMessage = connMsg;

    try {
      await client.connect();
    } catch (e) {
      print('connect exception: $e');
      client.disconnect();
    }

    client.updates?.listen((event) {
      final msg = event[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(msg.payload.message);
      print('received msg: $payload from topic: ${event[0].topic}');
    });

    _client = client;
    updateStateText('connected');

    return client;
  }

  void updateStateText(String text) {
    setState(() {
      stateText = text;
    });
  }

  void _subscribe() async {
    _client?.subscribe(_subTopic, MqttQos.exactlyOnce);
    print('$_subTopic subscribed');
  }

  void _publish() async {
    const pubMsg = 'hello world';
    final payloadBuilder = MqttClientPayloadBuilder();
    payloadBuilder.addUTF8String(pubMsg);
    _client?.publishMessage(
        _pubTopic, MqttQos.exactlyOnce, payloadBuilder.payload!);
    print('$pubMsg published to $_pubTopic');
  }

  void _unsubscribe() async {
    _client?.unsubscribe(_subTopic);
    print('$_subTopic unsubscribed');
  }

  void _disconnect() async {
    _client?.disconnect();
    updateStateText('disconnected');
  }
}
