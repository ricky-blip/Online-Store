import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/shared/config/config.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appScaffoldBlue,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: appBlack,
        ),
        backgroundColor: appScaffoldBlue,
        title: const Text(
          "Order Now",
          style: TextStyle(
            color: appBlack,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          //SECTION 1: ITEM ORDERED
          FutureBuilder(
            future: controller.getDataInputOrderNow(),
            builder: (context, snapshot) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: appWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: appSoftBlue,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //text Item Ordered
                        const Text(
                          "Item Ordered",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            //image
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Text("data"),
                                  // Image.network(
                                  //   controller.gambarProduct,
                                  //   width: 10,
                                  //   height: 10,
                                  //   // fit: BoxFit.cover,
                                  // ),
                                ),
                              ],
                            ),
                            // const SizedBox(width: 10),
                            // Spacer(),
                            //product name, total price,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "NAME:${controller.merkProduct} ${controller.namaProduct}",
                                      // style: blackTextStyle.copyWith(
                                      //   fontSize: 14,
                                      //   fontFamily: "Poppins",
                                      // ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      // "TOTAL PRICE",
                                      Config.convertToIdr(
                                        controller.grandTotal,
                                        0,
                                      ),
                                      // style: greyTextStyle.copyWith(
                                      //   fontSize: 12,
                                      //   fontFamily: "Poppins",
                                      // ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      // "TOTAL ITEMS ORDER",
                                      Config.convertToIdr(
                                        controller.grandTotal,
                                        0,
                                      ),
                                      // ),
                                      // style: greyTextStyle.copyWith(
                                      //   fontSize: 12,
                                      //   fontFamily: "Poppins",
                                      // ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        //DESCRIPTION
                        const SizedBox(height: 23),
                        Text(
                          "Descriptions",
                          // style: blackTextStyle.copyWith(
                          //   fontSize: 14,
                          //   fontFamily: "Poppins",
                          // ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          // controller: _orderNowC.catatan,
                          style: TextStyle(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            hintText: "Notes...",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          //SECTION 2: PAYMENT & DELIVERY(Dropdown)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Payment Method"),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomDropdownButton2(
                        buttonWidth: MediaQuery.of(context).size.width * 0.45,
                        dropdownWidth: MediaQuery.of(context).size.width * 0.45,
                        hint: 'Select',
                        value: controller.selectedPayment.value,
                        dropdownItems: controller.paymentMethod,
                        onChanged: (value) {
                          controller.selectedPayment.value = value!;
                          // ignore: avoid_print
                          print(value);
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Delivery Option"),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomDropdownButton2(
                        buttonWidth: MediaQuery.of(context).size.width * 0.41,
                        hint: 'Select',
                        value: controller.selectedDelivery.value,
                        dropdownItems: controller.delivery,
                        onChanged: (value) {
                          controller.selectedDelivery.value = value!;
                          // ignore: avoid_print
                          print(value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //SECTION 3: Delivered To
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Container(
              decoration: const BoxDecoration(
                color: appWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: appSoftBlue,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Deliver to:",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    //NAME
                    const Text(
                      "Name",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      // controller: _orderNowC.catatan,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: "name...",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //PHONE NUMBER
                    const Text(
                      "Phone No.",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      // controller: _orderNowC.catatan,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: "phone number....",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //ADDRESS
                    const Text(
                      "Address",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      // controller: _orderNowC.catatan,
                      minLines: 6,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: "address....",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //CITY
                    const Text(
                      "City",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Obx(
                      () => CustomDropdownButton2(
                        hint: 'Select',
                        value: controller.selectedCity.value,
                        dropdownItems: controller.city,
                        onChanged: (value) {
                          controller.selectedCity.value = value!;
                          // ignore: avoid_print
                          print(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      //SECTION 4: BOTTOM NAVBAR
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
                      "HARGA",
                      // Config.convertToIdr(productNewDetails.harga, 0),
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
                        // orderC.postOrderNow(
                        //   productNewDetails.id,
                        //   pdetailsC.quantity.value,
                        // );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 45,
                        child: const Center(
                          child: Text(
                            "Checkout Now",
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
