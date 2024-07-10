import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/sign_up_controller.dart';

class TaiyoSignupForm extends StatelessWidget {
  const TaiyoSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    TaiyoHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              // First Name
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TaiyoValidator.validateEmptyText('First name', value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TaiyoTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: TaiyoSizes.spaceBtwInputFields,
              ),

              // Last Name
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TaiyoValidator.validateEmptyText('Last name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TaiyoTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TaiyoSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            validator: (value) =>
                TaiyoValidator.validateEmptyText('Username', value),
            controller: controller.username,
            expands: false,
            decoration: const InputDecoration(
                labelText: TaiyoTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TaiyoSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            validator: (value) => TaiyoValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                labelText: TaiyoTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TaiyoSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            validator: (value) => TaiyoValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
                labelText: TaiyoTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TaiyoSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TextFormField(
              validator: (value) => TaiyoValidator.validatePasword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TaiyoTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
            ),
          ),
          const SizedBox(height: TaiyoSizes.spaceBtwInputFields),

          // TermsCondittions Checkbox
          //const TaiyoTermsAndConditionCheckbox(),
          const SizedBox(height: TaiyoSizes.spaceBtwSections),

          // Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TaiyoTexts.createAccount)),
          )
        ],
      ),
    );
  }
}
