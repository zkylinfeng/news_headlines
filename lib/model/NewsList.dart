class NewsList {
  String reason;
  Result result;
  NewsList({
    this.reason,this.result
  });
  NewsList.fromJson(Map<String,dynamic> json){
    reason=json['reason'];
    result
  }
}

class Result {
  int stat;
  List<News> data;
}
class News {
  String uniqukey;
  String title;
  String date;
  String category;
  String author_name;
  String url;
  String thumbnail_pic_s;
  News({
    this.uniqukey,this.title,this.date,this.author_name,this.category,this.url,this.thumbnail_pic_s
  });
News.fromJson(Map<String,dynamic> json){
   uniqukey=json['uniqukey'];
   title=json['title'];
   date=json['date'];
   category=json['category'];
   author_name=json['author_name'];
   url=json['url'];
   thumbnail_pic_s=json['thumbnail_pic_s'];
}

Map<String dynamic> toJson(){
  final  Map<String dynamic> json=new Map<String,dynamic>();
  json['uniqukey']= this.uniqukey;
  json['title']=this. title;
  json['date']=this.  date;
  json['category']=this.category;
  json['author_name']=this.author_name;
  json['url']=this.url;
  json['thumbnail_pic_s']=this.thumbnail_pic_s;
  return json;
}


}