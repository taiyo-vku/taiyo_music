import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/data/repositories/authentication/auth_repository.dart';
import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/loaders/popup/full_screen_loader.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/images_text.dart';
import '../../../personal/models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  //final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// --- SIGN UP

  void signup() async {
    try {
      // Start loading
      TaiyoFullScreenLoader.openLoadingDialog(
          'We are proccessing your information ...',
          TaiyoImages.docerAnimation);

      // Check Internet Connectivity
      // final isConnected = await NetwokManager.instance.isConnected();
      // if (!isConnected) {
      //   TaiyoFullScreenLoader.stopLoading();
      //   return;
      // }
      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TaiyoFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      // if (!privacyPolicy.value) {
      //   TaiyoLoaders.warningSnackBar(
      //       title: 'Accept Privacy Policy',
      //       mesage:
      //           'In order to create account, you must have t read and accept the Privacy Policy & Term of Use.');
      //   return;
      // }
      // Register uer in the Firebase Authentication & Sava user in the Firebase
      final userCredentials = await AuthRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user date in the Firebase FireStore
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // Show Success Message
      TaiyoLoaders.successSnackBar(
          title: 'Congratulations',
          mesage: 'Your account has been created! Verify email to contiune.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TaiyoLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

      // Show some Generic Error to the user.
      TaiyoFullScreenLoader.stopLoading();
    }
  }
}
