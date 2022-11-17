import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import '../controllers/order_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
          //SECTION ITEM ORDERED
          Container(
            width: MediaQuery.of(context).size.width,
            // height: 256,
            color: appWhite,
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                            child: Text("IMAGE"),
                            // child: Image.network(
                            //   // controller.,
                            //   width: 70,
                            //   height: 70,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ],
                      ),
                      // const SizedBox(width: 10),
                      Spacer(),
                      //product name, total price,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "PRODUCT NAME",
                                // "${_orderNowC.merkProduct} ${_orderNowC.namaProduct}",
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
                                "TOTAL PRICE",
                                // Config.convertToIdr(
                                //   _orderNowC.grandTotal,
                                //   0,
                                // ),
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
                                "TOTAL ITEMS ORDER",
                                // Config.convertToIdr(
                                //   _orderNowC.grandTotal,
                                //   0,
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
                      border: OutlineInputBorder(),
                      hintText: "Notes...",
                    ),
                  ),
                ],
              ),
            ),
          ),
          //SECTION PAYMENT & DELIVERY
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
