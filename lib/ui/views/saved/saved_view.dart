import 'package:flutter/material.dart';
import 'package:news_app/ui/views/saved/saved_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SavedViewModel>.nonReactive(
      viewModelBuilder: () => SavedViewModel(),
      builder: (
        BuildContext context,
        SavedViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SavedView',
            ),
          ),
        );
      },
    );
  }
}
