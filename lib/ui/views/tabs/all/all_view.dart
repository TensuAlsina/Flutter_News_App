import 'package:flutter/material.dart';
import 'package:news_app/ui/ui_helpers/ui_helpers.dart';
import 'package:news_app/ui/views/tabs/all/all_viewmodel.dart';
import 'package:news_app/ui/widgets/dumb_widgets/error_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/all_news.dart';
import '../../../widgets/dumb_widgets/news_container.dart';
import '../../../widgets/dumb_widgets/shimmer/myShimer.dart';

class AllNewsView extends StatelessWidget {
  final List<AllNews>? allAllNews;
  const AllNewsView({Key? key, this.allAllNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllNewsViewModel>.reactive(
      viewModelBuilder: () => AllNewsViewModel(),
      disposeViewModel: false,
      builder: (
        BuildContext context,
        AllNewsViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: allAllNews == null
              ? Text("")
              : ListView.separated(
                  key: const PageStorageKey("myStorage-key"),
                  separatorBuilder: (context, index) => SizedBox(
                        height: screenHeight(context) * 0.03,
                      ),
                  itemCount: allAllNews!.length,
                  itemBuilder: (context, index) {
                    return NewsContainer(
                      imageUrl: allAllNews![index].imageUrl,
                      author: allAllNews![index].author,
                      title: allAllNews![index].title,
                      date: allAllNews![index].date,
                      onTap: () => model.onClickTheNews(allAllNews![index]),
                    );
                  }),
        );
      },
    );
  }
}

class MyShimmerWidget extends StatelessWidget {
  const MyShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => SizedBox(
              height: screenHeight(context) * 0.28,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.imagePart(
                      height: screenHeight(context) * 0.2,
                      width: double.infinity),
                  SizedBox(
                    height: screenHeight(context) * 0.01,
                  ),
                  ShimmerWidget.textPart(
                      height: screenHeight(context) * 0.018,
                      width: screenWidth(context) * 0.3),
                  SizedBox(
                    height: screenHeight(context) * 0.01,
                  ),
                  ShimmerWidget.textPart(
                      height: screenHeight(context) * 0.018,
                      width: screenWidth(context) * 0.2),
                ],
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: screenHeight(context) * 0.01,
            ),
        itemCount: 10);
  }
}
