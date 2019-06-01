/// 主页面
///
/// @author Aaric, created on 2019-05-23T15:10.
/// @since 1.1.0-SNAPSHOT
import 'package:flutter/material.dart';
import './i18n/app_i18n.dart';
import './chat/message_page.dart';
import './contacts/contacts_page.dart';
import './personal/personal_page.dart';

class AppPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {


  Locale _locale = const Locale('zh','CN');

  var _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: _locale,
      child: Scaffold(
        appBar: AppBar(
          title: Text(ApplicationLocalizations.of(context).textChat),
        ),
        body: Center(
          child: RaisedButton(
            child: Text(ApplicationLocalizations.of(context).textOpenBrowser),
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
              title: Text(ApplicationLocalizations.of(context).textChat),
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
      ),
    );
  }

  void _tappedOnItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
