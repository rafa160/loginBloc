class News{

  final int id;
  final String images;

  News({this.id,this.images});

  static List<News> fromJsonArray(List<dynamic> jsonArray) {
    List<News> news = List<News>();

    jsonArray.forEach((itemJson) {
      news.add(News.fromJson(itemJson));
    });

    return news;
  }

  News.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    images = json["images"];


}