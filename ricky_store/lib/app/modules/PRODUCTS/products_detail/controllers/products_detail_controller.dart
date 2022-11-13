import 'package:get/get.dart';

class ProductsDetailController extends GetxController {
  RxInt quantity = 1.obs;
  increment() {
    if (quantity >= 1) {
      quantity++;
    }
  }

  decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
