
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_text.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/signup/verify_email_controller.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TaiyoSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                  image:
                      const AssetImage(TaiyoImages.deliveredEmailIllustration),
                  width: TaiyoHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TaiyoSizes.spaceBtwSections),

              //  Title & SubTitle
              Text(email ?? '',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TaiyoSizes.spaceBtwItems,
              ),
              Text('support@taiyo2.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: TaiyoSizes.spaceBtwItems),
              Text(TaiyoTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TaiyoSizes.spaceBtwSections,
              ),

              // Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.checkEmailVerificationStatus(),
                      child: const Text(TaiyoTexts.continues))),
              const SizedBox(
                height: TaiyoSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
                      child: const Text(TaiyoTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
