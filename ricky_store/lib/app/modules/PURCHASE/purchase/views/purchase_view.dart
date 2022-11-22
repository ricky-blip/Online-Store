import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/purchase_controller.dart';

class PurchaseView extends GetView<PurchaseController> {
  const PurchaseView({Key? key}) : super(key: key);
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
                  "Pay Now",
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: _orderC.orderNewList.length,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("PAY NOW");
                  },
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
