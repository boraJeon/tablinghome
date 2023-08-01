import 'package:flutter/material.dart';
import 'package:tablinghome/model/restaurant_model.dart';
import 'package:tablinghome/widget/RestaurantImage.dart';
import 'package:tablinghome/widget/TablingTile.dart';

class RestaurantListTile extends StatelessWidget {
  // final int index;
  final RestaurantModel restaurantModel;
  final VoidCallback onTapHandler;

  const RestaurantListTile({
    super.key,
    required this.restaurantModel,
    required this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return TablingTile(
      restaurantImageWidget: RestaurantImage(
        thumbnail: restaurantModel.thumbnail,
        border: Border.all(
          width: 1,
          color: Colors.deepPurple,
        ),
        radius: BorderRadius.circular(12),
      ),
      containerWidget: Column(
        children: [
          Text(
            restaurantModel.restaurantName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 17,
                color: Colors.yellow.shade600,
              ),
              Text(
                  "${restaurantModel.rating} (${restaurantModel.reviewCount})"),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "한식 - 요약주소1 - 28.98Km",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              restaurantModel.isQuickBooking
                  ? const Image(
                      width: 48,
                      height: 20,
                      image: AssetImage('assets/img/tag_reservation.png'),
                    )
                  : const SizedBox(),
              restaurantModel.isRemoteWaiting
                  ? const Image(
                      width: 48,
                      height: 20,
                      image: AssetImage('assets/img/tag_waiting.png'),
                    )
                  : const SizedBox(),
              restaurantModel.isOnSiteOrder
                  ? const Image(
                      width: 48,
                      height: 20,
                      image: AssetImage('assets/img/tag_order.png'),
                    )
                  : const SizedBox(),
              restaurantModel.isTakeOut
                  ? const Image(
                      width: 48,
                      height: 20,
                      image: AssetImage('assets/img/tag_takeout.png'),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
