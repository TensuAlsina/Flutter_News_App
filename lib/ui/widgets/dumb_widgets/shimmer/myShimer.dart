import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerWidget.imagePart(
      {super.key, required this.height, required this.width});
  const ShimmerWidget.textPart(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Container(
          width: width,
          height: height,
          color: Colors.grey,
        ),
      );
}
