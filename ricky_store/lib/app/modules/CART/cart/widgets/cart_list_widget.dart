import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/cart/cart_list_model.dart';
import 'package:ricky_store/app/modules/ORDER/order/controllers/order_controller.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

class CartListWidget extends StatelessWidget {
  CartListWidget({super.key, required this.listCart});
  final CartModel listCart;
  final orderC = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          shadowColor: appBlue,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            onTap: () {
              // Get.to(ProductsDetailNewView(productNewDetails: newProduct));
            },
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Ink.image(
                  image: NetworkImage(
                    "${Config.urlMain}storage/${listCart.gambar}",
                  ),
                  height: 100,
                  width: 150,
                  fit: BoxFit.fitHeight,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listCart.merkProduct,
                        style: Get.textTheme.subtitle1,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        listCart.namaProduct,
                        style: Get.textTheme.subtitle1,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${listCart.jumlah} Items",
                        style: Get.textTheme.subtitle1,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Config.convertToIdr(listCart.totalharga, 0),
                        style: Get.textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
