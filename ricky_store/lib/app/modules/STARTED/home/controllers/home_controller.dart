import 'package:get/get.dart';
import 'package:ricky_store/app/modules/STARTED/landing_page/views/landing_page_view.dart';
import 'package:ricky_store/app/modules/Authentication/profile/views/profile_view.dart';
import 'package:ricky_store/app/modules/CART/cart/views/cart_view.dart';

class HomeController extends GetxController {
  RxInt currentTab = 0.obs;

  final List screen = [
    LandingPageView(),
    const CartView(),
    ProfileView(),
  ];
}
