import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ricky_store/app/data/models/order(purchase)/order_model.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({super.key, required this.payOrder});
  final OrderModel payOrder;

  final controllerP = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    //SECTION Upload-Image
    takeImage(mContext) {
      return showDialog(
        context: mContext,
        builder: (context) {
          return SimpleDialog(
            title: const Text(
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
                      'Camera',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  controllerP.getImage(ImageSource.camera);
                },
              ),
              SimpleDialogOption(
                child: Row(
                  children: const [
                    Icon(Icons.image),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.back();
                  controllerP.getImage(ImageSource.gallery);
                },
              ),
              SimpleDialogOption(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                onPressed: () => Get.back(),
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
                            const Icon(
                              Icons.credit_card,
                              size: 100,
                            ),
                            const Text(
                              'Mandiri Virtual Account',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '90089181873817',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'a.n Syntop Laptopindo',
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              decoration: BoxDecoration(
                                color: appScaffoldBlue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Note : Silahkan bayar tagihan ini sebelum menggunakan transfer bank lagi',
                                  // style: whiteTextStyle.copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              decoration: BoxDecoration(
                                color: appScaffoldBlue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Obx(
                                          () => controllerP.selectedImagePath
                                                      .value ==
                                                  ''
                                              ? const Icon(
                                                  Icons
                                                      .drive_folder_upload_outlined,
                                                  size: 70,
                                                )
                                              : Image.file(
                                                  File(
                                                    controllerP
                                                        .selectedImagePath
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
                                            child: const Text(
                                              'Upload Payment Proof',
                                            ),
                                          ),
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
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Item Ordered'),
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
                                      "${payOrder.item.merkProduct} ${payOrder.item.namaProduct}",
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Config.convertToIdr(
                                              payOrder.item.totalharga,
                                              0,
                                            ),
                                          ),
                                          Text(
                                            "${payOrder.item.jumlah} Items",
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Details Transaction',
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${payOrder.item.merkProduct} ${payOrder.item.namaProduct}",
                                        ),
                                        const Spacer(),
                                        Text(
                                          Config.convertToIdr(
                                            payOrder.item.totalharga,
                                            0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          payOrder.jenisPengiriman,
                                        ),
                                        const Spacer(),
                                        Text(
                                          Config.convertToIdr(
                                            payOrder.ongkir,
                                            0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text('Total Price'),
                                        const Spacer(),
                                        Text(
                                          Config.convertToIdr(
                                            payOrder.item.totalharga +
                                                payOrder.ongkir,
                                            0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //Delivery to:
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Deliver To:',
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Name",
                                        ),
                                        const Spacer(),
                                        Text(
                                          payOrder.nama,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Text(
                                          "Phone No.",
                                        ),
                                        const Spacer(),
                                        Text(
                                          payOrder.nohp,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'City',
                                        ),
                                        const Spacer(),
                                        Text(
                                          payOrder.kotaKecamatan,
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            payOrder.buktiBayar != null
                ? GestureDetector(
                    onTap: () {
                      if (controllerP.selectedImagePath.value == '') {
                        Get.snackbar("Error", "Harap upload bukti bayar!");
                      } else {
                        //TODO - buat function untuk send data
                        // controllerP.sendData(payOrder.id.toString());
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 45,
                        child: Center(
                          child: Text(
                            'Kirim bukti bayar',
                            // style: whiteTextStyle.copyWith(
                            //     fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Pemesanan sedang diproses',
                          // style: whiteTextStyle.copyWith(
                          //     fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
