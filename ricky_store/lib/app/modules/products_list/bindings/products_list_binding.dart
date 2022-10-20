import 'package:get/get.dart';

import '../controllers/products_list_controller.dart';

class ProductsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsListController>(
      () => ProductsListController(),
    );
  }
}
