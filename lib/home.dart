import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 80,
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextField(
                    style: TextStyle(height: 2, color: Colors.black38),
                    decoration: InputDecoration(
                        border: InputBorder.none, fillColor: Colors.white),
                  ),
                ),
                Icon(Icons.camera_alt)
              ],
            ),
          )
        ],
      ),
    );
  }
}
