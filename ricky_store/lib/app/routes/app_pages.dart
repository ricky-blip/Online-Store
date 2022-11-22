import 'package:get/get.dart';

import '../modules/Authentication/login/bindings/login_binding.dart';
import '../modules/Authentication/login/views/login_view.dart';
import '../modules/Authentication/profile/bindings/profile_binding.dart';
import '../modules/Authentication/profile/views/profile_view.dart';
import '../modules/Authentication/register/bindings/register_binding.dart';
import '../modules/Authentication/register/views/register_view.dart';
import '../modules/CART/cart/bindings/cart_binding.dart';
import '../modules/CART/cart/views/cart_view.dart';
import '../modules/ORDER/checkout/bindings/checkout_binding.dart';
import '../modules/ORDER/checkout/views/checkout_view.dart';
import '../modules/ORDER/order/bindings/order_binding.dart';
import '../modules/ORDER/order/views/order_view.dart';
import '../modules/PRODUCTS/products_detail/bindings/products_detail_binding.dart';
import '../modules/PRODUCTS/products_detail/views/products_detail_new_view.dart';
import '../modules/PRODUCTS/products_list/bindings/products_list_binding.dart';
import '../modules/PRODUCTS/products_list/views/products_list_view.dart';
import '../modules/PRODUCTS/products_merk/bindings/products_merk_binding.dart';
import '../modules/PRODUCTS/products_merk/views/products_merk_view.dart';
import '../modules/PRODUCTS/products_search/bindings/products_search_binding.dart';
import '../modules/PRODUCTS/products_search/views/products_search_view.dart';
import '../modules/STARTED/home/bindings/home_binding.dart';
import '../modules/STARTED/home/views/home_view.dart';
import '../modules/STARTED/landing_page/bindings/landing_page_binding.dart';
import '../modules/STARTED/landing_page/views/landing_page_view.dart';
import '../modules/STARTED/landing_page/widgets/new_products_widget.dart';
import '../modules/STARTED/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/STARTED/splash_screen/views/splash_screen_view.dart';
import '../modules/PURCHASE/purchase/bindings/purchase_binding.dart';
import '../modules/PURCHASE/purchase/views/purchase_view.dart';

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
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS_LIST,
      page: () => ProductsListView(),
      binding: ProductsListBinding(),
    ),
    // GetPage(
    //   name: _Paths.PRODUCTS_DETAIL,
    //   page: () => ProductsDetailView(productNewDetails: newProduct),
    //   binding: ProductsDetailBinding(),
    // ),
    GetPage(
      name: _Paths.PRODUCTS_SEARCH,
      page: () =>
          const ProductsSearchView(keywordInput: Routes.PRODUCTS_SEARCH),
      binding: ProductsSearchBinding(),
    ),
    // GetPage(
    //   name: _Paths.PRODUCTS_MERK,
    //   page: () => ProductsMerkView(),
    //   binding: ProductsMerkBinding(),
    // ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE,
      page: () => const PurchaseView(),
      binding: PurchaseBinding(),
    ),
  ];
}
