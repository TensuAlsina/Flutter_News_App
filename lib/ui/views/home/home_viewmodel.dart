import 'package:news_app/api/get_apis.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final GetApis _apis = locator<GetApis>();

  void checkMe() async {
    await _apis.getNews(NewsCategory.all);
  }
}
