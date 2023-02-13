import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  void Function()? onPressed;

  MyErrorWidget({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.refresh,
            size: 45,
            color: Colors.black,
          )),
    );
  }
}
