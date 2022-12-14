import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricky_store/app/data/models/product/product_list_model.dart';
import 'package:ricky_store/app/data/models/product/product_new_model.dart';
import 'package:ricky_store/app/data/models/product/product_recommended_model.dart';
import 'package:ricky_store/app/modules/STARTED/landing_page/widgets/new_products_widget.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

class RatingsWidgetRecommended extends StatelessWidget {
  //NOTE Constractor
  const RatingsWidgetRecommended({super.key, required this.starRatings});

  final ProductRecommended starRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          ignoreGestures: true,
          itemSize: 13,
          initialRating: starRatings.rating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        // const SizedBox(width: 10),
        Text(
          starRatings.rating.toString(),
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
