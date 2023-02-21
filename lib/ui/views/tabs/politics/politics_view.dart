import 'package:flutter/material.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/ui/views/tabs/politics/politics_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/all_news.dart';
import '../../../ui_helpers/ui_helpers.dart';
import '../../../widgets/dumb_widgets/news_container.dart';
import '../all/all_view.dart';

class PoliticsView extends StatelessWidget {
  final List<AllNews>? allPoliticsNews;
  const PoliticsView({Key? key, required this.allPoliticsNews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PoliticsViewModel>.nonReactive(
      viewModelBuilder: () => PoliticsViewModel(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (
        BuildContext context,
        PoliticsViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: allPoliticsNews == null
              ? Text("Tensu")
              : ListView.separated(
                  key: const PageStorageKey("politicsStorage-key"),
                  separatorBuilder: (context, index) => SizedBox(
                        height: screenHeight(context) * 0.03,
                      ),
                  itemCount: allPoliticsNews!.length,
                  itemBuilder: (context, index) {
                    return NewsContainer(
                      imageUrl: allPoliticsNews![index].imageUrl,
                      author: allPoliticsNews![index].author,
                      title: allPoliticsNews![index].title,
                      date: allPoliticsNews![index].date,
                    );
                  }),
        );
      },
    );
  }
}
