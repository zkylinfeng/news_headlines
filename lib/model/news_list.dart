class NewsListModel {
  String reason;
  Result result;
  int error_code;
  NewsListModel({this.reason, this.result});
  NewsListModel.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    result = Result.fromJson(json['result']);
    error_code = json['error_code'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    if (this.result != null) {
      data['result'] = Result.fromJson(data['result']);
    }
    data['error_code'] = this.error_code;
    return data;
  }
}

class Result {
  String stat;
  List<News> data;
  Result({this.stat, this.data});
  Result.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    data = new List<News>();
    json['data'].forEach((v) {
      data.add(new News.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat'] = this.stat;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String uniqukey;
  String title;
  String date;
  String category;
  String author_name;
  String url;
  String thumbnail_pic_s;
  News(
      {this.uniqukey,
      this.title,
      this.date,
      this.author_name,
      this.category,
      this.url,
      this.thumbnail_pic_s});
  News.fromJson(Map<String, dynamic> json) {
    uniqukey = json['uniqukey'];
    title = json['title'];
    date = json['date'];
    category = json['category'];
    author_name = json['author_name'];
    url = json['url'];
    thumbnail_pic_s = json['thumbnail_pic_s'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['uniqukey'] = this.uniqukey;
    json['title'] = this.title;
    json['date'] = this.date;
    json['category'] = this.category;
    json['author_name'] = this.author_name;
    json['url'] = this.url;
    json['thumbnail_pic_s'] = this.thumbnail_pic_s;
    return json;
  }
}
