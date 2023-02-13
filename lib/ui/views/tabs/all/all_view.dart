import 'package:flutter/material.dart';
import 'package:news_app/ui/ui_helpers/ui_helpers.dart';
import 'package:news_app/ui/views/tabs/all/all_viewmodel.dart';
import 'package:news_app/ui/widgets/dumb_widgets/error_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../widgets/dumb_widgets/news_container.dart';
import '../../../widgets/dumb_widgets/shimmer/myShimer.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllNewsViewModel>.reactive(
      viewModelBuilder: () => locator<AllNewsViewModel>(),
      initialiseSpecialViewModelsOnce: false,
      fireOnViewModelReadyOnce: true,
      disposeViewModel: false,
      onViewModelReady: (viewModel) => viewModel.getAllData(),
      builder: (
        BuildContext context,
        AllNewsViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: model.isBusy
              ? const MyShimmerWidget()
              : !model.hasError
                  ? MyErrorWidget(
                      onPressed: () => model.getAllData(),
                    )
                  : ListView.separated(
                      key: const PageStorageKey("myStorage-key"),
                      separatorBuilder: (context, index) => SizedBox(
                            height: screenHeight(context) * 0.03,
                          ),
                      itemCount: model.allNews.length,
                      itemBuilder: (context, index) {
                        return NewsContainer(
                          imageUrl: model.allNews[index].imageUrl,
                          author: model.allNews[index].author,
                          title: model.allNews[index].title,
                          date: model.allNews[index].date,
                          onTap: () =>
                              model.onClickTheNews(model.allNews[index]),
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
