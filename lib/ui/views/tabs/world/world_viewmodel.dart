import 'package:stacked/stacked.dart';

import '../../../../api/get_apis.dart';
import '../../../../app/app.locator.dart';
import '../../../../models/all_news.dart';
import '../../../../services/news_services.dart';

class WorldViewModel extends FutureViewModel<List<AllNews>> {
  final NewsServices _newsServices = locator<NewsServices>();

  Future<List<AllNews>> getAllData() async {
    return await _newsServices.getAllNews(NewsCategory.world);
  }

  @override
  Future<List<AllNews>> futureToRun() {
    return getAllData();
  }
}
