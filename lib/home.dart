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
            height: 20,
          ),
          Container(
            color: Colors.red,
            height: 60,
            padding: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: TextField(
                        style: TextStyle(color: Colors.black38),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
