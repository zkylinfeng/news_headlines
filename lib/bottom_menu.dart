import 'package:flutter/material.dart';
import 'home.dart';
import 'weather.dart';
import 'my.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  List<Widget> pageList = new List();
  int currentIndex = 0;

  @override
  void initState() {
    pageList..add(HomePage())..add(Weather())..add(MyPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.lightBlue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.redAccent,
              ),
              title: Text('首页', style: TextStyle(color: Colors.redAccent))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.slow_motion_video,
                color: Colors.redAccent,
              ),
              title: Text('天气', style: TextStyle(color: Colors.redAccent))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.redAccent,
              ),
              title: Text('我的', style: TextStyle(color: Colors.redAccent)))
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,/* 默认是fixed */
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
