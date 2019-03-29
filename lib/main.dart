import 'package:flutter/material.dart';
import 'bottom_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news_headlines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomMenu(),
    );
  }
}
