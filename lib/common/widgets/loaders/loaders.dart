import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class TaiyoLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: TaiyoHelperFunctions.isDarkMode(Get.context!)
              ? TaiyoColors.darkerGrey.withOpacity(.9)
              : TaiyoColors.grey.withOpacity(.9),
        ),
        child: Center(
          child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          ),
        ),
      ),
    ));
  }

  static warningSnackBar({required title, mesage = '', duration = ''}) {
    Get.snackbar(
      title,
      mesage,
      isDismissible: true,
      shouldIconPulse: true,
      backgroundColor: Colors.orange,
      colorText: TaiyoColors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TaiyoColors.white),
    );
  }

  static successSnackBar({required title, mesage = ''}) {
    Get.snackbar(
      title,
      mesage,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TaiyoColors.white,
      backgroundColor: TaiyoColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TaiyoColors.white),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TaiyoColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TaiyoColors.white),
    );
  }
}
