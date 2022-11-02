import 'package:get/get.dart';

import '../controllers/products_search_controller.dart';

class ProductsSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsSearchController>(
      () => ProductsSearchController(),
    );
  }
}
