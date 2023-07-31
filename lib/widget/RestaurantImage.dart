import 'package:flutter/material.dart';

class RestaurantImage extends StatelessWidget {
  // 옵셔널 위치가 스위프트랑 달라서 신기
  final BorderRadius? radius;
  final Border? border;
  final String thumbnail;

  const RestaurantImage({
    super.key,
    required this.thumbnail,
    this.border,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: (border != null) ? border : null,
          borderRadius: (radius != null) ? radius : null),
      clipBehavior: Clip.hardEdge,
      width: 100,
      height: 100,
      child: Image.network(
        thumbnail,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
