import 'package:flutter/material.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/ui/views/tabs/entertainment/entertainment_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../ui_helpers/ui_helpers.dart';
import '../../../widgets/dumb_widgets/news_container.dart';
import '../all/all_view.dart';

class EntertainmentView extends StatelessWidget {
  const EntertainmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EntertainmentViewModel>.nonReactive(
      viewModelBuilder: () => locator<EntertainmentViewModel>(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (
        BuildContext context,
        EntertainmentViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: model.isBusy
              ? const MyShimmerWidget()
              : ListView.separated(
                  key: const PageStorageKey("enterStorage-key"),
                  separatorBuilder: (context, index) => SizedBox(
                        height: screenHeight(context) * 0.03,
                      ),
                  itemCount: model.data!.length,
                  itemBuilder: (context, index) {
                    return NewsContainer(
                      imageUrl: model.data![index].imageUrl,
                      author: model.data![index].author,
                      title: model.data![index].title,
                      date: model.data![index].date,
                    );
                  }),
        );
      },
    );
  }
}
