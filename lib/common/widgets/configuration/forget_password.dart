import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/authentication/controllers/password/forget_password_controller.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_string.dart';
import '../../../utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TaiyoSizes.defaultSpace),
        child: Column(
          children: [
            // Headings
            Text(TaiyoTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TaiyoSizes.spaceBtwItems),
            Text(TaiyoTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TaiyoSizes.spaceBtwSections * 2),

            // Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => TaiyoValidator.validateEmail(value),
                decoration: const InputDecoration(
                    labelText: TaiyoTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: TaiyoSizes.spaceBtwSections),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(TaiyoTexts.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}
