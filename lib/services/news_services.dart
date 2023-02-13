import 'package:news_app/models/all_news.dart';

import '../api/get_apis.dart';
import '../app/app.locator.dart';

class NewsServices {
  final GetApis _apis = locator<GetApis>();

  Future<List<AllNews>> getAllNews(NewsCategory category) async {
    try {
      List<AllNews> allNews = await _apis.getNews(category);
      return allNews;
    } catch (e) {
      rethrow;
    }
  }
}
