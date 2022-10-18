import 'package:get/get.dart';
import 'package:ricky_store/app/modules/profile/views/profile_view.dart';

import '../../order/views/order_view.dart';

class HomeController extends GetxController {
  RxInt currentTab = 0.obs;

  final List screen = [
    const OrderView(),
    const ProfileView(),
  ];
}
