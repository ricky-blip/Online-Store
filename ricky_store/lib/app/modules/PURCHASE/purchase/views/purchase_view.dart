import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/order(purchase)/order_model.dart';
import 'package:ricky_store/app/modules/PURCHASE/purchase/widgets/purchase_list_widget.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/purchase_controller.dart';

class PurchaseView extends GetView<PurchaseController> {
  PurchaseView({Key? key}) : super(key: key);
  final purchaseC = Get.lazyPut(() => PurchaseController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: appScaffoldBlue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 1,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          backgroundColor: appSoftBlue,
          iconTheme: const IconThemeData(
            color: appWhite,
            size: 30,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.shopping_bag_sharp),
              SizedBox(width: 10),
              Text(
                "Your Orders",
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: appScaffoldBlue,
            indicatorWeight: 4,
            tabs: [
              Tab(
                child: Text(
                  "Checkout Now",
                  // style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "In Progress",
                  // style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Past Order",
                  // style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        //NOTE Body
        body: TabBarView(
          children: [
            //NOTE Payment(NEW)
            ListView(
              children: [
                Column(
                  children: [
                    FutureBuilder<List<OrderModel>>(
                      future: controller.getOrderNew(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Waiting Data. . .");
                        } else if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                ...snapshot.data!.map(
                                  (e) => PurchaseListWidget(listOrderNew: e),
                                ),
                              ],
                            ),
                          );
                        }
                        return const Text("Data Need Checkout");
                      },
                    ),
                  ],
                ),
              ],
            ),
            //NOTE In Progress(Process)
            ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: _orderC.orderNewList.length,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("IN PROGRESS");
                  },
                ),
              ],
            ),
            //NOTE Past Order(Done)
            ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: _orderC.orderNewList.length,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("DONE");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
