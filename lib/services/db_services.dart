import 'package:hive/hive.dart';

import '../models/all_news.dart';

class DataBaseServices {
  var allNewsBox = Hive.box<AllNews>("apiNews");

  Future putData(List<AllNews> allNews) async {
    await allNewsBox.clear();
    for (var news in allNews) {
      allNewsBox.add(news);
    }
  }
}
