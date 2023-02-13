// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import '../api/get_apis.dart';
import '../services/news_services.dart';
import '../ui/views/tabs/all/all_viewmodel.dart';
import '../ui/views/tabs/business/business_viewmodel.dart';
import '../ui/views/tabs/entertainment/entertainment_viewmodel.dart';
import '../ui/views/tabs/politics/politics_viewmodel.dart';
import '../ui/views/tabs/sports/sports_viewmodel.dart';
import '../ui/views/tabs/technology/technology.viewmodel.dart';
import '../ui/views/tabs/world/world_viewmodel.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => GetApis());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => NewsServices());
  locator.registerLazySingleton(() => AllNewsViewModel());
  locator.registerLazySingleton(() => BusinessViewModel());
  locator.registerLazySingleton(() => EntertainmentViewModel());
  locator.registerLazySingleton(() => PoliticsViewModel());
  locator.registerLazySingleton(() => SportsViewModel());
  locator.registerLazySingleton(() => TechnologyViewModel());
  locator.registerLazySingleton(() => WorldViewModel());
  locator.registerLazySingleton(() => NavigationService());
}
