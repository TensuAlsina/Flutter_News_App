import 'package:flutter/material.dart';
import 'package:news_app/models/all_news.dart';
import 'package:stacked/stacked.dart';

import '../../ui_helpers/ui_helpers.dart';
import 'detail_viewmodel.dart';

class DetailView extends StatelessWidget {
  final AllNews allNews;
  const DetailView({Key? key, required this.allNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.nonReactive(
      viewModelBuilder: () => DetailViewModel(),
      builder: (
        BuildContext context,
        DetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight(context) * 0.4,
                  width: double.infinity,
                  child: Image(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(allNews.imageUrl)),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    allNews.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 15, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allNews.author,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const Text(
                            "Author",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    allNews.content,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
