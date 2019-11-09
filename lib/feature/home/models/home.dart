import 'dart:convert';

import 'package:for_coworking/feature/home/models/news.dart';

class Home{
  final List<News> news;

  Home({this.news});

  Home.fromJson(Map<String, dynamic>json)
      : news = News.fromJsonArray(json["news"]);
}