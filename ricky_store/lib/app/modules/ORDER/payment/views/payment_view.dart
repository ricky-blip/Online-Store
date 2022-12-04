import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/order(purchase)/order_model.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({super.key, required this.payOrder});
  final OrderModel payOrder;

  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    //SECTION Upload-Image
    takeImage(mContext) {
      return showDialog(
        context: mContext,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Pilih',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              SimpleDialogOption(
                child: Row(
                  children: const [
                    Icon(Icons.camera_alt),
                    Text(
                      'Kamera',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // orderController.getImage(ImageSource.camera);
                },
              ),
              SimpleDialogOption(
                child: Row(
                  children: const [
                    Icon(Icons.image),
                    Text(
                      'Galeri ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.back();
                  // orderController.getImage(ImageSource.gallery);
                },
              ),
              SimpleDialogOption(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }

    //SECTON Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              color: appWhite,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            // Image.asset(
                            //   'assets/mandiri_icon.png',
                            //   width: 100,
                            // ),
                            Icon(
                              Icons.credit_card,
                              size: 100,
                            ),
                            Text(
                              'Mandiri Virtual Account',
                              // style: blackTextStyle.copyWith(
                              //   fontSize: 12,
                              //   fontWeight: FontWeight.normal,
                              // ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '90089181873817',
                              // style: blackTextStyle.copyWith(
                              //   fontSize: 18,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'a.n Syntop Laptopindo',
                              // style: blackTextStyle.copyWith(
                              //   fontSize: 13,
                              //   fontWeight: FontWeight.bold,
                              // ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Note : Silahkan bayar tagihan ini sebelum menggunakan transfer bank lagi',
                                  // style: whiteTextStyle.copyWith(fontSize: 12),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: appScaffoldBlue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Obx(
                                          () => controller.selectedImagePath
                                                      .value ==
                                                  ''
                                              ? Icon(
                                                  Icons
                                                      .drive_folder_upload_outlined,
                                                  size: 70,
                                                )
                                              : Image.file(
                                                  File(
                                                    controller.selectedImagePath
                                                        .value,
                                                  ),
                                                  fit: BoxFit.contain,
                                                  height: 100,
                                                  width: 300,
                                                ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: appGreen,
                                            ),
                                            onPressed: () {
                                              takeImage(context);
                                            },
                                            child: Text(
                                              'Upload Payment Proof',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: appScaffoldBlue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item Ordered',
                              // style: blackTextStyle.copyWith(
                              //   fontSize: 14,
                              // ),
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
                                        payOrder.item.gambar,
                                        width: 70,
                                        height: 70,
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
                                      'Lenovo Thinkpad T570s',
                                      // style: blackTextStyle.copyWith(
                                      //     fontWeight: FontWeight.w500,
                                      //     fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: Row(
                                        children: [
                                          Text(
                                            'IDR 12.289.000',
                                            // style: greyTextStyle.copyWith(
                                            //     fontSize: 12),
                                          ),
                                          Text(
                                            '1 Items',
                                            // style: blackTextStyle.copyWith(
                                            //     fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Details Section
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Details Transaction',
                                      // style: blackTextStyle.copyWith(
                                      //   fontSize: 14,
                                      // ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Lenovo Thinkpad T570s',
                                          // style: greyTextStyle,
                                        ),
                                        const Spacer(),
                                        Text(
                                          'IDR 12.289.000',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Kurir Instant',
                                        ),
                                        const Spacer(),
                                        Text(
                                          'IDR 50.000',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Total Price',
                                        ),
                                        const Spacer(),
                                        Text(
                                          'IDR 12.339.000',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Transfer Bank',
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Mandiri VA',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
