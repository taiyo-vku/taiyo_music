import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/styles/spacing.dart';
import '../../../../common/widgets/form/form_divider.dart';
import '../../../../common/widgets/form/social_button.dart';
import '../../../../utils/constants/text_string.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TaiyoSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo , Title & Sub-Title
              const TaiyoLoginHeader(),

              // Form
              const TaiyoLoginForm(),

              /// Divider
              TaiyoFormDivider(
                  deviderText: TaiyoTexts.orSignInWith.capitalize!),
              const SizedBox(height: TaiyoSizes.spaceBtwSections),

              /// Footer
              const TaiyoSocialButton(),

              
            ],
          ),
        ),
      ),
    );
  }
}
