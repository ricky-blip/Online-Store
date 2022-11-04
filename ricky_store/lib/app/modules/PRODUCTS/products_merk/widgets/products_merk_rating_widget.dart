import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/merk/merk_product_model.dart';

class RatingsWidgetProductMerk extends StatelessWidget {
  //NOTE Constractor
  const RatingsWidgetProductMerk({super.key, required this.starRatings});

  final MerkProduct starRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          ignoreGestures: true,
          itemSize: 14,
          initialRating: starRatings.rating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // ignore: avoid_print
            print(rating);
          },
        ),
        const SizedBox(width: 3),
        Text(
          starRatings.rating.toString(),
          style: Get.textTheme.subtitle2,
        ),
      ],
    );
  }
}
