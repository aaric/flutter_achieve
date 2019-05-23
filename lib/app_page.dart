/// 主页面
///
/// @author Aaric, created on 2019-05-23T15:10.
/// @since 1.1.0-SNAPSHOT
import 'package:flutter/material.dart';
import './chat/message_page.dart';
import './contacts/contacts_page.dart';
import './personal/personal_page.dart';

class AppPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  var _appTitle = '聊天';
  var _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Search'),
          onPressed: () {
            Navigator.of(context).pushNamed('/website');
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _tappedOnItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Text('聊天'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('联系人'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('我的'),
          ),
        ],
      ),
    );
  }

  void _tappedOnItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
