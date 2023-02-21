import 'package:flutter/material.dart';
import 'package:news_app/ui/views/myhome/myhome_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
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
    final TabController tabController = TabController(length: 4, vsync: this);

    return ViewModelBuilder<MyHomeViewModel>.reactive(
      viewModelBuilder: () => locator<MyHomeViewModel>(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
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
                        contentPadding: const EdgeInsets.all(12),
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
                    // Tab(
                    //   text: "Business",
                    // ),
                    // Tab(
                    //   text: "World",
                    // ),
                    // Tab(
                    //   text: "Entertainment",
                    // ),
                    Tab(
                      text: "Technology",
                    ),
                  ],
                ),
                model.fetchingAllSportNews &&
                        model.fetchingAllAllNews &&
                        model.fetchingAllPoliticsNews
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: TabBarView(
                        controller: tabController,
                        children: [
                          AllNewsView(
                            allAllNews: model.fetchedAllAllNews,
                          ),
                          SportsView(
                            allSportNews: model.fetchedAllSportNews,
                          ),
                          PoliticsView(
                            allPoliticsNews: model.fetchedAllPoliticsNews,
                          ),
                          // BusinessView(),
                          // WorldView(),
                          // EntertainmentView(),
                          TechnologyView(
                            allTechnologyNews: model.fetchedAllTechnologyNews,
                          ),
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

// import 'package:flutter/material.dart';
// import 'package:news_app/ui/views/myhome/myhome_viewmodel.dart';
// import 'package:stacked/stacked.dart';

// class MultipleFuturesExampleView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MultipleFuturesExampleViewModel>.reactive(
//         builder: (context, viewModel, child) => Scaffold(
//               body: Center(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       width: 50,
//                       height: 50,
//                       alignment: Alignment.center,
//                       color: Colors.yellow,
//                       // Show busy for number future until the data is back or has failed
//                       child: viewModel.fetchingNumber
//                           ? CircularProgressIndicator()
//                           : Text(viewModel.fetchedNumber.toString()),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       width: 50,
//                       height: 50,
//                       alignment: Alignment.center,
//                       color: Colors.red,
//                       // Show busy for string future until the data is back or has failed
//                       child: viewModel.fetchingAllAllNews
//                           ? CircularProgressIndicator()
//                           : Text(viewModel.fetchedString),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         viewModelBuilder: () => MultipleFuturesExampleViewModel());
//   }
// }
