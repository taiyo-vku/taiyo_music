import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_string.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/spacing.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TaiyoSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(image),
                width: TaiyoHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TaiyoSizes.spaceBtwSections),

              // Title & SubTitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TaiyoSizes.spaceBtwItems,
              ),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TaiyoSizes.spaceBtwSections,
              ),

              // Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(TaiyoTexts.continues))),
            ],
          ),
        ),
      ),
    );
  }
}
