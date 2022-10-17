import 'package:flutter/material.dart';

class NewProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 185,
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
    );
  }
}
