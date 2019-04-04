class WeatherModel {
  String reason;
  int errorCode;
  ResultBean result;

  WeatherModel({this.reason, this.errorCode, this.result});

  WeatherModel.fromJson(Map<String, dynamic> json) {    
    this.reason = json['reason'];
    this.errorCode = json['error_code'];
    this.result = json['result'] != null ? ResultBean.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    data['error_code'] = this.errorCode;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }

}

class ResultBean {
  String city;
  RealtimeBean realtime;
  List<FutureListBean> future;

  ResultBean({this.city, this.realtime, this.future});

  ResultBean.fromJson(Map<String, dynamic> json) {    
    this.city = json['city'];
    this.realtime = json['realtime'] != null ? RealtimeBean.fromJson(json['realtime']) : null;
    this.future = (json['future'] as List)!=null?(json['future'] as List).map((i) => FutureListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    if (this.realtime != null) {
      data['realtime'] = this.realtime.toJson();
    }
    data['future'] = this.future != null?this.future.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class RealtimeBean {
  String temperature;
  String humidity;
  String info;
  String wid;
  String direct;
  String power;
  String aqi;

  RealtimeBean({this.temperature, this.humidity, this.info, this.wid, this.direct, this.power, this.aqi});

  RealtimeBean.fromJson(Map<String, dynamic> json) {    
    this.temperature = json['temperature'];
    this.humidity = json['humidity'];
    this.info = json['info'];
    this.wid = json['wid'];
    this.direct = json['direct'];
    this.power = json['power'];
    this.aqi = json['aqi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['humidity'] = this.humidity;
    data['info'] = this.info;
    data['wid'] = this.wid;
    data['direct'] = this.direct;
    data['power'] = this.power;
    data['aqi'] = this.aqi;
    return data;
  }
}

class FutureListBean {
  String date;
  String temperature;
  String weather;
  String direct;
  WidBean wid;

  FutureListBean({this.date, this.temperature, this.weather, this.direct, this.wid});

  FutureListBean.fromJson(Map<String, dynamic> json) {    
    this.date = json['date'];
    this.temperature = json['temperature'];
    this.weather = json['weather'];
    this.direct = json['direct'];
    this.wid = json['wid'] != null ? WidBean.fromJson(json['wid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['temperature'] = this.temperature;
    data['weather'] = this.weather;
    data['direct'] = this.direct;
    if (this.wid != null) {
      data['wid'] = this.wid.toJson();
    }
    return data;
  }
}

class WidBean {
  String day;
  String night;

  WidBean({this.day, this.night});

  WidBean.fromJson(Map<String, dynamic> json) {    
    this.day = json['day'];
    this.night = json['night'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    return data;
  }
}
