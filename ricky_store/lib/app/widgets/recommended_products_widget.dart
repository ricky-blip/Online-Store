import 'package:flutter/material.dart';

class RecommendedProductsWidget extends StatelessWidget {
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
                      FlutterLogo(
                        size: 150,
                      ),
                      SizedBox(height: 8),
                      Text("Products"),
                      SizedBox(height: 7),
                      Text("Harga"),
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
