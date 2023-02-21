import 'package:flutter/material.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/ui/views/tabs/sports/sports_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/all_news.dart';
import '../../../ui_helpers/ui_helpers.dart';
import '../../../widgets/dumb_widgets/news_container.dart';

class SportsView extends StatelessWidget {
  final List<AllNews>? allSportNews;
  const SportsView({Key? key, required this.allSportNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SportsViewModel>.nonReactive(
      viewModelBuilder: () => SportsViewModel(),
      disposeViewModel: false,
      builder: (
        BuildContext context,
        SportsViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: allSportNews == null
              ? Text("NULLLLL")
              : ListView.separated(
                  key: const PageStorageKey("sportStorage-key"),
                  separatorBuilder: (context, index) => SizedBox(
                        height: screenHeight(context) * 0.03,
                      ),
                  itemCount: allSportNews!.length,
                  itemBuilder: (context, index) {
                    return NewsContainer(
                      imageUrl: allSportNews![index].imageUrl,
                      author: allSportNews![index].author,
                      title: allSportNews![index].title,
                      date: allSportNews![index].date,
                    );
                  }),
        );
      },
    );
  }
}
