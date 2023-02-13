import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.white,
            systemOverlayStyle:
                SystemUiOverlayStyle(systemStatusBarContrastEnforced: false)),
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.homeView,
      // home: const MyHomePage(),
    );
  }
}
