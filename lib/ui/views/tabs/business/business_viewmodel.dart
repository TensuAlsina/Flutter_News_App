import 'package:news_app/models/all_news.dart';
import 'package:stacked/stacked.dart';

import '../../../../api/get_apis.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/news_services.dart';

class BusinessViewModel extends FutureViewModel<List<AllNews>> {
  final NewsServices _newsServices = locator<NewsServices>();

  Future<List<AllNews>> getAllData() async {
    return await _newsServices.getAllNews(NewsCategory.business);
  }

  @override
  Future<List<AllNews>> futureToRun() {
    return getAllData();
  }
}
