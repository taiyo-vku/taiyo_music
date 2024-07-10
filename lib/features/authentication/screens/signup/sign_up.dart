

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/form/form_divider.dart';
import '../../../../common/widgets/form/social_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import 'widgets/sign_up_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TaiyoSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(TaiyoTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TaiyoSizes.spaceBtwSections),

              // Form
              const TaiyoSignupForm(),
              const SizedBox(height: TaiyoSizes.spaceBtwSections),

              // Divider
              TaiyoFormDivider(deviderText: TaiyoTexts.orSignUWith.capitalize!),
              const SizedBox(height: TaiyoSizes.spaceBtwSections),

              // Social Button
              const TaiyoSocialButton(),
              const SizedBox(
                height: TaiyoSizes.spaceBtwSections,
              )
            ],
          ),
        ),
      ),
    );
  }
}
