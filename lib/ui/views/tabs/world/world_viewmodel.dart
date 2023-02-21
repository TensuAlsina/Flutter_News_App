import 'package:news_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../api/get_apis.dart';
import '../../../../app/app.locator.dart';
import '../../../../models/all_news.dart';
import '../../../../services/news_services.dart';

class WorldViewModel extends FutureViewModel<List<AllNews>> {
  final NewsServices _newsServices = locator<NewsServices>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<List<AllNews>> getAllData() async {
    return await _newsServices.getAllNews(NewsCategory.world);
  }

  @override
  Future<List<AllNews>> futureToRun() {
    return getAllData();
  }

  Future onClickTheNews(AllNews allNews) async {
    await _navigationService.navigateToDetailView(allNews: allNews);
  }
}
