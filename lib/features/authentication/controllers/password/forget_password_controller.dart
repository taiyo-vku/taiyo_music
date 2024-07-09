import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/data/repositories/authentication/auth_repository.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/loaders/popup/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading

      // TaiyoFullScreenLoader.openLoadingDialog('', TaiyoImages.docerAnimation);

      // Check Internet
      // final isConnected = await NetwokManager.instance.isConnected();
      // if (!isConnected) {
      //   TaiyoFullScreenLoader.stopLoading();
      //   return;
      // }

      // Form Validate
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TaiyoFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TaiyoFullScreenLoader.stopLoading();

      // Show success Screen
      TaiyoLoaders.successSnackBar(
          title: 'Email Sent',
          mesage: 'Email Link Sent to Reset your Password.');

      // Redirect
      // TODO : RESET PASSWORD
      // Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TaiyoFullScreenLoader.stopLoading();
      TaiyoLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: 'Something went wrong. Please try again.');
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // TODO :  Start Loading
      // TaiyoFullScreenLoader.openLoadingDialog('', TaiyoImages.docerAnimation);

      // Check Internet
      // final isConnected = await NetwokManager.instance.isConnected();
      // if (!isConnected) {
      //   TaiyoFullScreenLoader.stopLoading();
      //   return;
      // }

      // Send Email to Reset Password
      await AuthRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TaiyoFullScreenLoader.stopLoading();

      // Show success Screen
      TaiyoLoaders.successSnackBar(
          title: 'Email Sent',
          mesage: 'Email Link Sent to Reset your Password.'.tr);
    } catch (e) {
      // Remove Loader
      TaiyoFullScreenLoader.stopLoading();
      TaiyoLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: 'Something went wrong. Please try again.');
    }
  }
}
