import 'package:flutter/material.dart';
import 'package:jnumap_flutter_app/human_page.dart';
import 'package:jnumap_flutter_app/life_page.dart';
import 'package:jnumap_flutter_app/nature_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HumanPage(),
      NaturePage(),
      LifePage()
    ];
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Center(child: _pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
          onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Container(child: Text('人')), title: Text('인문',textAlign: TextAlign.center,)),
              BottomNavigationBarItem(icon: Container(child: Text('自')), title: Text('자연',textAlign: TextAlign.center,)),
              BottomNavigationBarItem(icon: Container(child: Text('生')), title: Text('생활',textAlign: TextAlign.center,)),
            ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
      builder: (context) => AlertDialog(
        title: Text('종료하시겠습니까'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("네")),
          FlatButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('아니오')),
        ],
      )
    );
  }
}
