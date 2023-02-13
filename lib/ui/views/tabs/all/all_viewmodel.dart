import 'package:news_app/api/get_apis.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/app/app.router.dart';
import 'package:news_app/models/all_news.dart';
import 'package:news_app/services/news_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AllNewsViewModel extends FutureViewModel<List<AllNews>> {
  final NewsServices _newsServices = locator<NewsServices>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<List<AllNews>> getAllData() async {
    try {
      return await _newsServices.getAllNews(NewsCategory.all);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AllNews>> futureToRun() {
    return getAllData();
  }

  void tryToRefetchData() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 3));

    setBusy(false);
    setError(true);
  }

  @override
  void onError(error) {
    _snackbarService.showSnackbar(message: "Check your Internet Connection");
  }

  Future onClickTheNews(AllNews allNews) async {
    await _navigationService.navigateToDetailView(allNews: allNews);
  }
}
