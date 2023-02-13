import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/all_news.dart';

enum NewsCategory {
  all,
  sport,
  business,
  politics,
  technology,
  world,
  entertainment
}

class GetApis {
  static const String endPoint = "https://inshorts.deta.dev/news?category=";
  Future<List<AllNews>> getNews(NewsCategory category) async {
    String endPointCategory = getEndPointCategory(category);
    List<AllNews> allNews = [];
    try {
      var response = await http.get(Uri.parse("$endPoint$endPointCategory"));
      var parsed = jsonDecode(response.body);
      for (var news in parsed['data']) {
        allNews.add(AllNews.fromJson(news));
      }
      return allNews;
    } catch (e) {
      rethrow;
    }
  }

  String getEndPointCategory(NewsCategory category) {
    switch (category) {
      case NewsCategory.all:
        return "all";
      case NewsCategory.business:
        return "business";
      case NewsCategory.entertainment:
        return "entertainment";
      case NewsCategory.politics:
        return "politics";
      case NewsCategory.sport:
        return "sport";
      case NewsCategory.technology:
        return "technology";
      case NewsCategory.world:
        return "world";
      default:
        return "Non";
    }
  }
}
