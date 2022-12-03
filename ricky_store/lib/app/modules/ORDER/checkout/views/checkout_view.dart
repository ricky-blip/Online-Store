import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/order(purchase)/order_model.dart';
import 'package:ricky_store/app/modules/ORDER/payment/views/payment_view.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key, required this.checkOut});
  final OrderModel checkOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      // Items Product
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              color: appWhite,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SECTION Item Ordered
                        const Text(
                          'Item Ordered',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    checkOut.item.gambar,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${checkOut.item.merkProduct} ${checkOut.item.namaProduct}",
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          Config.convertToIdr(
                                            checkOut.item.totalharga,
                                            0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${checkOut.item.jumlah} Items",
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // SECTION Details Section
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: appScaffoldBlue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Text(
                                    checkOut.catatan,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Details Transaction',
                                // style: blackTextStyle.copyWith(
                                //   fontSize: 14,
                                // ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${checkOut.item.merkProduct} ${checkOut.item.namaProduct}",
                                  ),
                                  const Spacer(),
                                  Text(
                                    Config.convertToIdr(
                                      checkOut.item.totalharga,
                                      0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    checkOut.jenisPengiriman,
                                  ),
                                  const Spacer(),
                                  Text(
                                    Config.convertToIdr(
                                      checkOut.ongkir,
                                      0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Price',
                                    // style: greyTextStyle,
                                  ),
                                  const Spacer(),
                                  Text(
                                    Config.convertToIdr(
                                      checkOut.item.totalharga +
                                          checkOut.ongkir,
                                      0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // SECTION Delivery to Section
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: appWhite,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery to',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Name',
                            ),
                            const Spacer(),
                            Text(
                              checkOut.nama,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone No.',
                              // style: greyTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              checkOut.nohp,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Address',
                            ),
                            const Spacer(),
                            Text(
                              checkOut.alamat,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'City',
                              // style: greyTextStyle,
                            ),
                            const Spacer(),
                            Text(
                              checkOut.kotaKecamatan,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      //SECTION BUTTON
      bottomNavigationBar: BottomAppBar(
        color: appScaffoldBlue,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Price: ",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      Config.convertToIdr(
                        checkOut.item.totalharga + checkOut.ongkir,
                        0,
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appSoftBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        //Route here!
                        Get.to(
                          PaymentView(payOrder: checkOut),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 45,
                        child: const Center(
                          child: Text(
                            "Payment Now",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
