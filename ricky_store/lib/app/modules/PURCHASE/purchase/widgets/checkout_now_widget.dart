import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/order(purchase)/order_model.dart';
import 'package:ricky_store/app/modules/ORDER/checkout/views/checkout_view.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

class CheckoutNowWidget extends StatelessWidget {
  const CheckoutNowWidget({super.key, required this.listOrderNew});
  final OrderModel listOrderNew;

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
              Get.to(
                CheckoutView(checkOut: listOrderNew),
              );
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Ink.image(
                      image: NetworkImage(
                        listOrderNew.item.gambar,
                      ),
                      height: 100,
                      width: 150,
                      fit: BoxFit.fitHeight,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listOrderNew.item.merkProduct,
                            style: Get.textTheme.subtitle1,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            listOrderNew.item.namaProduct,
                            style: Get.textTheme.subtitle1,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${listOrderNew.item.jumlah} Items",
                            style: Get.textTheme.subtitle1,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            Config.convertToIdr(
                                listOrderNew.item.totalharga, 0),
                            style: Get.textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
