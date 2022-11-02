import 'package:get/get.dart';
import 'package:ricky_store/app/modules/STARTED/landing_page/widgets/new_products_widget.dart';

import '../modules/PRODUCTS/products_detail/bindings/products_detail_binding.dart';
import '../modules/PRODUCTS/products_detail/views/products_detail_view.dart';
import '../modules/PRODUCTS/products_list/bindings/products_list_binding.dart';
import '../modules/PRODUCTS/products_list/views/products_list_view.dart';
import '../modules/STARTED/home/bindings/home_binding.dart';
import '../modules/STARTED/home/views/home_view.dart';
import '../modules/STARTED/landing_page/bindings/landing_page_binding.dart';
import '../modules/STARTED/landing_page/views/landing_page_view.dart';
import '../modules/STARTED/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/STARTED/splash_screen/views/splash_screen_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/PRODUCTS/products_search/bindings/products_search_binding.dart';
import '../modules/PRODUCTS/products_search/views/products_search_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  //FIXME
  static var newProduct;

  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_PAGE,
      page: () => LandingPageView(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS_LIST,
      page: () => const ProductsListView(),
      binding: ProductsListBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS_DETAIL,
      page: () => ProductsDetailView(productDetails: newProduct),
      binding: ProductsDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS_SEARCH,
      page: () => const ProductsSearchView(),
      binding: ProductsSearchBinding(),
    ),
  ];
}
