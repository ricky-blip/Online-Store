import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: appScaffoldBlue,
        appBar: AppBar(
          centerTitle: false,
          elevation: 1,
          toolbarHeight: 100,
          backgroundColor: appSoftBlue,
          iconTheme: IconThemeData(color: appBlack),
          leading: const Icon(Icons.shopping_cart),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Order",
              ),
            ],
          ),
          // flexibleSpace: ,
          //Note Tab Bar

          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: appScaffoldBlue,
            indicatorWeight: 4,
            tabs: [
              Tab(
                child: Text(
                  "New",
                  // style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Process",
                  // style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Done",
                  // style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        //NOTE Body
        body: TabBarView(
          children: [
            //NOTE New
            ListView(
              children: [
                ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // itemCount: _orderC.orderNewList.length,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Text("NEW");
                      },
                    ),
                  ],
                ),
              ],
            ),
            //NOTE Process
            ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: _orderC.orderNewList.length,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("PROCESS");
                  },
                ),
              ],
            ),
            //NOTE Done
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
