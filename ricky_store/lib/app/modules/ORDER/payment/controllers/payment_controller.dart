import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PaymentController extends GetxController {
  //SECTION Access Image/Gallery

  //NOTE Upload Proof of Payment
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: imageSource,
      maxHeight: 720,
      maxWidth: 1280,
    );

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb ";

      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar(
        'Warning!',
        'No Image Selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 218, 113, 28),
        margin: const EdgeInsets.only(bottom: 6, right: 6, left: 6),
        colorText: Colors.white,
      );
    }
  }

  //TODO - Upload Proof of Payment with access gallery and camera device user
  
}
