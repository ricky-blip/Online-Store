import 'package:get/get.dart';

import '../controllers/products_merk_controller.dart';

class ProductsMerkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsMerkController>(
      () => ProductsMerkController(),
    );
  }
}
