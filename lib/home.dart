import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'model/news_list.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'common_web.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    return Scaffold(body: TabViews());
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
          backgroundColor: Colors.red,
          title: Container(
            color: Colors.red,
            height: 60,
            padding: EdgeInsets.all(1),
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
          ),
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
  List<News> list = [];
  RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    getList();
    super.initState();
  }

  getList() async {
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/json;charset=UTF-8");
    Response response = await dio.get('http://v.juhe.cn/toutiao/index?type=' +
        widget.typeName +
        '&key=f835e23f8bbaae262c2b542d63867cd0');
    print(response.data);
    if (response.data['result'] == null) {
      Fluttertoast.showToast(
          msg: response.data['reason'], gravity: ToastGravity.CENTER);
    } else {
      Result result = Result.fromJson(response.data['result']);
      setState(() {
        list.addAll(result.data);
      });
    }
    _refreshController.sendBack(true, RefreshStatus.completed);
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        //onOffsetChange: _onOffsetCallback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      return new NewsWebPage(
                        list[position].url,
                        list[position].title,
                      ); //link,title为需要传递的参数
                    },
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        list[position].thumbnail_pic_s,
                        width: 150.0,
                        height: 120.0,
                        fit: BoxFit.fill,
                      ),
                      Expanded(
                          child: Container(
                        height: 120,
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Text(
                                list[position].title,
                                textDirection: TextDirection.rtl,
                                softWrap: true,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(list[position].author_name),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      list[position].date,
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ));
          },
        ));
  }

  void _onRefresh(bool up) {
    if (up) {
      //headerIndicator callback
      getList();
    } else {
      //footerIndicator Callback
      getList();
    }
  }
}
