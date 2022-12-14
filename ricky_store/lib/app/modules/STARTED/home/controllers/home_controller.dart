import 'package:get/get.dart';
import 'package:ricky_store/app/modules/Authentication/login/views/login_view.dart';
import 'package:ricky_store/app/modules/PURCHASE/purchase/views/purchase_view.dart';
import 'package:ricky_store/app/modules/STARTED/landing_page/views/landing_page_view.dart';
import 'package:ricky_store/app/modules/Authentication/profile/views/profile_view.dart';
import 'package:ricky_store/app/modules/CART/cart/views/cart_view.dart';
import 'package:sp_util/sp_util.dart';

class HomeController extends GetxController {
  RxInt currentTab = 0.obs;

  final List screen = [
    LandingPageView(),
    SpUtil.getString("name_user") == "" ? LoginView() : CartView(),
    SpUtil.getString("name_user") == "" ? LoginView() : PurchaseView(),
    SpUtil.getString("name_user") == "" ? LoginView() : ProfileView(),
    ProfileView(),
  ];
}
