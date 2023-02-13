import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/models/all_news.dart';
import 'package:news_app/services/db_services.dart';

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
  final DataBaseServices _dataBaseServices = locator<DataBaseServices>();
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
      await _dataBaseServices.putData(allNews);

      return allNews;
    } catch (SocketException) {
      print("No Internet");
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
