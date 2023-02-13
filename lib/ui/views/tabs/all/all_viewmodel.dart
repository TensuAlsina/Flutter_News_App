import 'package:news_app/api/get_apis.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/app/app.router.dart';
import 'package:news_app/models/all_news.dart';
import 'package:news_app/services/news_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AllNewsViewModel extends BaseViewModel {
  final NewsServices _newsServices = locator<NewsServices>();
  // final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();
  List<AllNews> _allNews = [];
  List<AllNews> get allNews => _allNews;

  getAllData() async {
    try {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 3));
      _allNews = await _newsServices.getAllNews(NewsCategory.all);
      setBusy(false);
      setError(false);
      notifyListeners();
    } catch (e) {
      setError(true);
      setBusy(false);
      notifyListeners();

      rethrow;
    }
  }

  void tryToRefetchData() async {
    await getAllData();
  }

  Future onClickTheNews(AllNews allNews) async {
    await _navigationService.navigateToDetailView(allNews: allNews);
  }
}
