import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/cart/cart_list_model.dart';
import 'package:ricky_store/app/modules/ORDER/order/controllers/order_controller.dart';
import 'package:ricky_store/app/modules/ORDER/order/views/order_view.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key, required this.listCart});
  final CartModel listCart;

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
            child: Column(
              children: [
                Row(
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
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    backgroundColor: appBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    //TODO route here!
                    Get.to(
                      OrderView(orderCart: listCart),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: const Center(
                      child: Text(
                        "Order Now",
                        style: TextStyle(
                          fontSize: 20,
                          color: appWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
