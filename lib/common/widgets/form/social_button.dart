import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_text.dart';
import '../../../utils/constants/sizes.dart';

class TaiyoSocialButton extends StatelessWidget {
  const TaiyoSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TaiyoColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: const Image(
                width: TaiyoSizes.iconMd,
                height: TaiyoSizes.iconMd,
                image: AssetImage(TaiyoImages.google)),
            // TODO : GOOGLE LOGIN
            onPressed: () => {},
          ),
        ),
        const SizedBox(
          width: TaiyoSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TaiyoColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            icon: const Image(
              width: TaiyoSizes.iconMd,
              height: TaiyoSizes.iconMd,
              image: AssetImage(TaiyoImages.facebook),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
