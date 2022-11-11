import 'package:get/get.dart';
import 'package:ricky_store/app/routes/app_pages.dart';
import 'package:ricky_store/app/shared/constant/color.dart';
import 'package:sp_util/sp_util.dart';

class ProfileController extends GetxController {
  //SECTION Logout
  void logout() {
    try {
      //remove data/cache from memory device
      SpUtil.clear();

      //jalankan pesan berhasil
      Get.snackbar(
        "Success",
        "Log Out!",
        backgroundColor: appGreen,
      );

      //redirect to Home
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar(
        "Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appRed,
        colorText: appWhite,
      );
    }
  }
}
