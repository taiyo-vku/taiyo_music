import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';

class TaiyoLoginForm extends StatelessWidget {
  const TaiyoLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      // key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TaiyoSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              validator: (value) =>
                  TaiyoValidator.validateEmptyText('Email', value),
              // controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TaiyoTexts.email),
            ),
            const SizedBox(
              height: TaiyoSizes.spaceBtwInputFields,
            ),

            // Password
            Obx(
              () => TextFormField(
                validator: (value) =>
                    TaiyoValidator.validateEmptyText('Password', value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TaiyoTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(height: TaiyoSizes.spaceBtwInputFields / 2),

            // Remmber Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remmember Me
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                      const Text(TaiyoTexts.remmberMe),
                    ],
                  ),
                ),

                /// Forget Passowrd
                TextButton(
                  // TODO : FORGET PASSWORD SCREEN
                  onPressed: () {},
                  child: const Text(TaiyoTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: TaiyoSizes.spaceBtwSections,
            ),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // TODO : LOGIN FORM
                onPressed: () => controller.loginFormKey,
                child: const Text(TaiyoTexts.signIn),
              ),
            ),
            const SizedBox(
              height: TaiyoSizes.spaceBtwItems,
            ),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                // TODO : SIGN UP SCREEN
                onPressed: () {},
                child: const Text(TaiyoTexts.createAccount),
              ),
            ),
            const SizedBox(
              height: TaiyoSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
