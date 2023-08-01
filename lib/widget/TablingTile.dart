import 'package:flutter/material.dart';

import 'RestaurantImage.dart';

class TablingTile extends StatelessWidget {
  final RestaurantImage restaurantImageWidget;
  final Widget containerWidget;

  final VoidCallback? onTapHandler;

  const TablingTile({
    super.key,
    required this.restaurantImageWidget,
    required this.containerWidget,
    this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler?.call,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(
          children: [
            restaurantImageWidget,
            const SizedBox(
              width: 8,
            ),
            containerWidget,
          ],
        ),
      ),
    );
  }
}
