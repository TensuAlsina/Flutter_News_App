import 'package:flutter/material.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/ui/views/tabs/technology/technology.viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/all_news.dart';
import '../../../ui_helpers/ui_helpers.dart';
import '../../../widgets/dumb_widgets/news_container.dart';
import '../all/all_view.dart';

class TechnologyView extends StatelessWidget {
  final List<AllNews>? allTechnologyNews;
  const TechnologyView({Key? key, required this.allTechnologyNews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TechnologyViewModel>.nonReactive(
      viewModelBuilder: () => TechnologyViewModel(),
      disposeViewModel: false,
      builder: (
        BuildContext context,
        TechnologyViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: ListView.separated(
              key: const PageStorageKey("technologyStorage-key"),
              separatorBuilder: (context, index) => SizedBox(
                    height: screenHeight(context) * 0.03,
                  ),
              itemCount: allTechnologyNews!.length,
              itemBuilder: (context, index) {
                return NewsContainer(
                  imageUrl: allTechnologyNews![index].imageUrl,
                  author: allTechnologyNews![index].author,
                  title: allTechnologyNews![index].title,
                  date: allTechnologyNews![index].date,
                  onTap: () => model.onClickTheNews(allTechnologyNews![index]),
                );
              }),
        );
      },
    );
  }
}
