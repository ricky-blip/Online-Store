import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ricky_store/app/data/models/order(purchase)/order_model.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key, required this.payOrder});
  final OrderModel payOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Payment Your Order',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
