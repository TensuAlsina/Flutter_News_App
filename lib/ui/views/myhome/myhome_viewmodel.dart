// ignore_for_file: constant_identifier_names

import 'package:stacked/stacked.dart';

import '../../../api/get_apis.dart';
import '../../../app/app.locator.dart';
import '../../../models/all_news.dart';
import '../../../services/news_services.dart';

const String _ALLALLNEWS = "all";
const String _ALLPOLITICSNEWS = "sport";
const String _ALLSPORTNEWS = "politics";
const String _ALLTECHNOLOGYNEWS = "technology";

class MyHomeViewModel extends MultipleFutureViewModel {
  final NewsServices _newsServices = locator<NewsServices>();

  get fetchedAllPoliticsNews => dataMap![_ALLPOLITICSNEWS];
  get fetchedAllAllNews => dataMap![_ALLALLNEWS];
  get fetchedAllSportNews => dataMap![_ALLSPORTNEWS];
  get fetchedAllTechnologyNews => dataMap![_ALLTECHNOLOGYNEWS];

  bool get fetchingAllPoliticsNews => busy(_ALLPOLITICSNEWS);
  bool get fetchingAllSportNews => busy(_ALLSPORTNEWS);
  bool get fetchingAllAllNews => busy(_ALLALLNEWS);
  bool get fetchingAllTechnologyNews => busy(_ALLTECHNOLOGYNEWS);

  @override
  Map<String, Future Function()> get futuresMap => {
        _ALLALLNEWS: getAllNews,
        _ALLPOLITICSNEWS: getPoliticsNews,
        _ALLSPORTNEWS: getSportNews,
        _ALLTECHNOLOGYNEWS: getTechnologyNews,
      };

  Future<List<AllNews>> getAllNews() async {
    List<AllNews> allNews = await _newsServices.getAllNews(NewsCategory.all);

    return allNews;
  }

  Future<List<AllNews>> getSportNews() async {
    List<AllNews> allSportNews =
        await _newsServices.getAllNews(NewsCategory.sports);

    return allSportNews;
  }

  Future<List<AllNews>> getPoliticsNews() async {
    List<AllNews> allPoliticsNews =
        await _newsServices.getAllNews(NewsCategory.politics);

    return allPoliticsNews;
  }

  Future<List<AllNews>> getTechnologyNews() async {
    List<AllNews> allTechnologyNews =
        await _newsServices.getAllNews(NewsCategory.technology);

    return allTechnologyNews;
  }
}
