import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/cart/cart_list_model.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key, required this.listCart});
  final CartModel listCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 3,
          shadowColor: appBlue,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Get.to(ProductsDetailNewView(productNewDetails: newProduct));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Ink.image(
                    image: NetworkImage(listCart.gambar),
                    height: 100,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listCart.namaProduct,
                          style: Get.textTheme.subtitle1,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${listCart.jumlah} Items",
                          style: Get.textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
