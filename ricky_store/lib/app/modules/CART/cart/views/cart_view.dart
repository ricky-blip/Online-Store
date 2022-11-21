import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                  "Cart",
                  // style: blackTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Payment",
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
            //NOTE Cart(List Cart)
            ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: _orderC.orderNewList.length,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("CART");
                  },
                ),
              ],
            ),
            //NOTE Payment(NEW)
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
