import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'model/weather_model.dart';
import 'common_web.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String currentTemperature = '';
  String info = "";
  List<FutureListBean> futureList = List<FutureListBean>();

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  getWeather() async {
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/json;charset=UTF-8");
    Response response = await dio.get(
        'http://apis.juhe.cn/simpleWeather/query?city=%E6%98%86%E5%B1%B1&key=7821f716eb57df032199e9a1203d7878');
    print(response.data);
    if (response.data['result'] == null) {
      Fluttertoast.showToast(
          msg: response.data['reason'], gravity: ToastGravity.CENTER);
    } else {
      ResultBean result = ResultBean.fromJson(response.data['result']);
      setState(() {
        currentTemperature = result.realtime.temperature;
        info = result.realtime.info;
        futureList = result.future;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.lightBlue,
      padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
      child: Column(
        children: <Widget>[
          Text(currentTemperature,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30)),
          Text(info,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18)),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Text('昆山',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          //
          Container(
              height: 250,
              child: ListView.separated(
                  itemCount: futureList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return new Divider(
                      height: 1.0,
                      color: Colors.white,
                    );
                  },
                  itemBuilder: (BuildContext context, int position) {
                    FutureListBean bean = futureList[position];
                    return Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(bean.date,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))),
                          Expanded(
                              flex: 1,
                              child: Text(bean.weather,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))),
                          Expanded(
                              flex: 1,
                              child: Text(
                                bean.temperature,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ))
                        ],
                      ),
                    );
                  })),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) {
                    return new NewsWebPage(
                      'http://m.weathercn.com',
                      '更多天气',
                    ); //link,title为需要传递的参数
                  },
                ));
              },
              child: Text(
                '查看多天预报',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black26, fontSize: 18),
              )),
        ],
      ),
    ));
  }
}
