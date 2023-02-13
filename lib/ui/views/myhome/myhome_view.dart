import 'package:flutter/material.dart';
import 'package:news_app/ui/views/myhome/myhome_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../ui_helpers/ui_helpers.dart';
import '../tabs/all/all_view.dart';
import '../tabs/business/business_view.dart';
import '../tabs/entertainment/entertainment_view.dart';
import '../tabs/politics/politics_view.dart';
import '../tabs/sports/sports_view.dart';
import '../tabs/technology/technology_view.dart';
import '../tabs/world/world_view.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key}) : super(key: key);

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 7, vsync: this);

    return ViewModelBuilder<MyHomeViewModel>.nonReactive(
      viewModelBuilder: () => MyHomeViewModel(),
      builder: (
        BuildContext context,
        MyHomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: screenHeight(context) * 0.06,
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        suffixIcon: const Icon(Icons.search),
                        hintText: "Enter keywords..",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: const TextStyle(fontSize: 14),
                  labelStyle: const TextStyle(fontSize: 22),
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Sports",
                    ),
                    Tab(
                      text: "Politics",
                    ),
                    Tab(
                      text: "Business",
                    ),
                    Tab(
                      text: "World",
                    ),
                    Tab(
                      text: "Entertainment",
                    ),
                    Tab(
                      text: "Technology",
                    ),
                  ],
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: const [
                    AllNewsView(),
                    SportsView(),
                    PoliticsView(),
                    BusinessView(),
                    WorldView(),
                    EntertainmentView(),
                    TechnologyView(),
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
