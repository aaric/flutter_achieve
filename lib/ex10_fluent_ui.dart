import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text('hello fluent'),
        actions: Row(
          children: []
        ),
        automaticallyImplyLeading: true
      ),
      pane: NavigationPane(
        displayMode: PaneDisplayMode.auto,
        selected: _currentIndex,
        onChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
          print('_currentIndex: $_currentIndex');
        },
        items: [
          PaneItem(
            icon: const Icon(Icons.code),
            title: const Text('Code Pane')
          ),
          PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text('Settings Pane')
          )
        ]
      ),
      content: NavigationBody(
        index: _currentIndex,
        children: [
          ScaffoldPage(
            header: Text('Title 01'),
            content: Center(
              child: Text('Content 01')
            ),
            bottomBar: BottomNavigation(
              index: 0,
              items: const [
                BottomNavigationItem(
                  icon: Icon(Icons.phone_android),
                  selectedIcon: Icon(Icons.phone_android),
                  title: Text('Android')
                ),
                BottomNavigationItem(
                  icon: Icon(Icons.phone_iphone),
                  selectedIcon: Icon(Icons.phone_iphone),
                  title: Text('iOS')
                )
              ]
            )
          ),
          ScaffoldPage(
            header: Text('Title 02'),
            content: Center(
                child: Text('Content 02')
            )
          )
        ]
      )
    );
  }
}
