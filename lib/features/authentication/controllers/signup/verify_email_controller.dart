

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_app/data/repositories/authentication/auth_repository.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/screens/success_screen.dart';
import '../../../../utils/constants/images_text.dart';
import '../../../../utils/constants/text_string.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email Whenever Verify Screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  // Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthRepository.instance.sendEmailVerification();
      TaiyoLoaders.successSnackBar(
          title: 'Email Sent',
          mesage: 'Please Check your inbox and verify your email.');
    } catch (e) {
      TaiyoLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verfication
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TaiyoImages.successfullyRegisterAnimation,
            title: TaiyoTexts.yourAccountCreateTitle,
            subTitle: TaiyoTexts.yourAccountCreateSubTitle,
            onPressed: () =>
                AuthRepository.instance.screenRedirect()));
      }
    });
  }

  // Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TaiyoImages.successfullyRegisterAnimation,
          title: TaiyoTexts.yourAccountCreateTitle,
          subTitle: TaiyoTexts.yourAccountCreateSubTitle,
          onPressed: () => AuthRepository.instance.screenRedirect()));
    }
  }
}
