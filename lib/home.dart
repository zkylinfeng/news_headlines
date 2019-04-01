import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TabViews()
        //  Column(
        //   children: <Widget>[
        //     Container(
        //       color: Colors.red,
        //       height: 20,
        //     ),
        //     Container(
        //       color: Colors.red,
        //       height: 60,
        //       padding: EdgeInsets.all(15),
        //       child: Row(
        //         children: <Widget>[
        //           Expanded(
        //               flex: 1,
        //               child: Container(
        //                 padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        //                 decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.all(Radius.circular(6))),
        //                 child: TextField(
        //                   style: TextStyle(color: Colors.black38),
        //                   decoration: InputDecoration(border: InputBorder.none),
        //                 ),
        //               )),
        //           Container(
        //             margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        //             child: Icon(
        //               Icons.camera_alt,
        //               color: Colors.white,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //     TabViews(),

        //   ],
        // ),
        );
  }
}

class TabView {
  const TabView({this.title, this.typeName});
  final String title;
  final String typeName;
}

const List<TabView> tabs = const <TabView>[
  const TabView(title: '头条', typeName: 'top'),
  const TabView(title: '社会', typeName: 'shehui'),
  const TabView(title: '国内', typeName: 'guonei'),
  const TabView(title: '国际', typeName: 'guoji'),
  const TabView(title: '娱乐', typeName: 'yule'),
  const TabView(title: '体育', typeName: 'tiyu'),
  const TabView(title: '军事', typeName: 'junshi'),
  const TabView(title: '科技', typeName: 'keji'),
  const TabView(title: '财经', typeName: 'caijing'),
  const TabView(title: '时尚', typeName: 'shishang'),
];

class TabViews extends StatefulWidget {
  @override
  _TabViewsState createState() => _TabViewsState();
}

class _TabViewsState extends State<TabViews>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            tabs: tabs.map((TabView tabview) {
              return new Tab(
                text: tabview.title,
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: tabs.map((TabView tabview) {
            return NewsList(
              typeName: tabview.typeName,
            );
          }).toList(),
        ));
  }
}

class NewsList extends StatefulWidget {
  NewsList({Key key, this.typeName}) : super(key: key);
  final String typeName;
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    getList();
    super.initState();
  }

  getList() async {
    Dio dio = new Dio();
    Response response = await dio.get('http://v.juhe.cn/toutiao/index?type=' +
        widget.typeName +
        '&key=f835e23f8bbaae262c2b542d63867cd0');
    //print(response.data);
    var result = json.decode(response.data);
    print(result['reason']);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
