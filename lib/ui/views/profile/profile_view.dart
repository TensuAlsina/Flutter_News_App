import 'package:flutter/material.dart';
import 'package:news_app/ui/ui_helpers/ui_helpers.dart';
import 'package:news_app/ui/views/profile/profile_viewmodel.dart';

import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (
        BuildContext context,
        ProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight(context) * 0.35,
                  color: Colors.indigo,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Title Goes Here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Content goes here",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
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
