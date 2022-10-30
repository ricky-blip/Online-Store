import 'package:get/get.dart';

import '../controllers/products_detail_controller.dart';

class ProductsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsDetailController>(
      () => ProductsDetailController(),
    );
  }
}
