import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _subTopic = '/msg/client/2';
  final _pubTopic = '/msg/server/default';
  MqttServerClient? _client;

  var stateText = 'disconnected';

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/mqtt_client
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title)
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$stateText'),
              ElevatedButton(onPressed: _reconnect, child: const Text('reconnect')),
              ElevatedButton(onPressed: _subscribe, child: const Text('subscribe')),
              ElevatedButton(onPressed: _publish, child: const Text('publish')),
              ElevatedButton(onPressed: _unsubscribe, child: const Text('unsubscribe')),
              ElevatedButton(onPressed: _disconnect, child: const Text('disconnect'))
            ]
          )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  void initStateAsync() async {
    _client = await _connect();
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
        // Replaced by keepAlivePeriod
        // .keepAliveFor(60)
        .withWillTopic(_pubTopic)
        .withWillMessage('{"state": "dead"}')
        // Non persistent session for testing
        .startClean()
        .withWillQos(MqttQos.exactlyOnce);
    client.connectionMessage = connMsg;
    client.keepAlivePeriod = 60;

    try {
      await client.connect();
    } catch (e) {
      updateStateText('connect exception: $e');
      client.disconnect();
    }

    client.updates?.listen((event) {
      final msg = event[0].payload as MqttPublishMessage;
      final payload = MqttPublishPayload.bytesToStringAsString(msg.payload.message);
      updateStateText('received msg: $payload from topic: ${event[0].topic}');
    });

    // _client = client;
    updateStateText('connected');

    return client;
  }

  void updateStateText(String text) {
    setState(() {
      stateText = text;
    });
    print('$text');
  }

  void _reconnect() async {
    if (MqttConnectionState.connected != _client?.connectionStatus?.state) {
      _client = await _connect();
      updateStateText('reconnected');
    } else {
      print('reconnected not must');
    }
  }

  void _subscribe() async {
    _client?.subscribe(_subTopic, MqttQos.exactlyOnce);
    updateStateText('$_subTopic subscribed');
  }

  void _publish() async {
    const pubMsg = '{"msg": "hello mqtt"}';
    final payloadBuilder = MqttClientPayloadBuilder();
    payloadBuilder.addUTF8String(pubMsg);
    _client?.publishMessage(
        _pubTopic, MqttQos.exactlyOnce, payloadBuilder.payload!, retain: true);
    updateStateText('$pubMsg published to $_pubTopic');
  }

  void _unsubscribe() async {
    _client?.unsubscribe(_subTopic);
    updateStateText('$_subTopic unsubscribed');
  }

  void _disconnect() async {
    _client?.disconnect();
    updateStateText('disconnected');
  }
}
