import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import 'widgets/login_form.dart';


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
