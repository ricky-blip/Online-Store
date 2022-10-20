import 'package:flutter/material.dart';
import 'package:ricky_store/app/data/models/product_recommended_model.dart';

class RecommendedProductsWidget extends StatelessWidget {
  ProductRecommended recommendedW;

  RecommendedProductsWidget({required this.recommendedW});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 25,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 158,
              child: Card(
                elevation: 5,
                color: Colors.black38,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.network(
                        recommendedW.gambar,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 8),
                      Text(recommendedW.namaProduct),
                      SizedBox(height: 7),
                      Text(recommendedW.harga.toString()),
                      SizedBox(height: 29),
                      Text("Rating"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
