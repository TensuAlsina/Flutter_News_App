import 'package:flutter/material.dart';

import '../../ui_helpers/ui_helpers.dart';

class NewsContainer extends StatelessWidget {
  final void Function()? onTap;
  final String imageUrl;
  final String title;
  final String author;
  final String date;
  const NewsContainer(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.date,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight(context) * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, offset: Offset(3, 5), blurRadius: 4)
            ]),
        child: Column(
          children: [
            SizedBox(
                height: screenHeight(context) * 0.2,
                width: double.infinity,
                // color: Colors.red,
                child:
                    Image(fit: BoxFit.fitWidth, image: NetworkImage(imageUrl))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        date,
                        style: const TextStyle(color: Colors.black45),
                      )
                    ],
                  ),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.bookmark))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
