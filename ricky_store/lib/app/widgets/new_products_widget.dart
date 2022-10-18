import 'package:flutter/material.dart';
import 'package:ricky_store/app/config/config.dart';
import 'package:ricky_store/app/constant/color.dart';
import 'package:ricky_store/app/data/models/product_new_model.dart';

class NewProductsWidget extends StatelessWidget {
  final ProductNew newProduct;

  const NewProductsWidget({super.key, required this.newProduct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 185,
            child: Card(
              shadowColor: appBlue,
              color: appScaffoldBlue,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.network(
                      newProduct.gambar,
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 8),
                    Text(newProduct.namaProduct),
                    SizedBox(height: 7),
                    Text(newProduct.harga.toString()),
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
