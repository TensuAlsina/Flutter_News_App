import 'package:news_app/api/get_apis.dart';
import 'package:news_app/services/db_services.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/ui/views/home/home_view.dart';
import 'package:news_app/ui/views/news_detail/detail_view.dart';
import 'package:news_app/ui/views/tabs/all/all_viewmodel.dart';
import 'package:news_app/ui/views/tabs/business/business_viewmodel.dart';
import 'package:news_app/ui/views/tabs/entertainment/entertainment_viewmodel.dart';
import 'package:news_app/ui/views/tabs/politics/politics_viewmodel.dart';
import 'package:news_app/ui/views/tabs/sports/sports_viewmodel.dart';
import 'package:news_app/ui/views/tabs/technology/technology.viewmodel.dart';
import 'package:news_app/ui/views/tabs/world/world_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/myhome/myhome_viewmodel.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  CupertinoRoute(page: DetailView)
], dependencies: [
  LazySingleton(classType: GetApis),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: NewsServices),
  LazySingleton(classType: AllNewsViewModel),
  LazySingleton(classType: BusinessViewModel),
  LazySingleton(classType: EntertainmentViewModel),
  LazySingleton(classType: PoliticsViewModel),
  LazySingleton(classType: SportsViewModel),
  LazySingleton(classType: TechnologyViewModel),
  LazySingleton(classType: WorldViewModel),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DataBaseServices),
  LazySingleton(classType: MyHomeViewModel),
])
class $App {}
