import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/utils/device/device_utility.dart';
import 'package:music_app/utils/helpers/helper_functions.dart';

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
        // TODO : GOOGLE LOGIN
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
            onPressed: () => {},
          ),
        ),
        const SizedBox(
          width: TaiyoSizes.spaceBtwItems,
        ),
        // TODO : FACEBOOK LOGIN
        if (TaiyoDeviceUtils.isAndroid())
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
        const SizedBox(
          width: TaiyoSizes.spaceBtwItems,
        ),
        // TODO : APPLE LOGIN

        if (TaiyoDeviceUtils.isIOS())
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: TaiyoColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              icon: const Image(
                width: TaiyoSizes.iconMd,
                height: TaiyoSizes.iconMd,
                image: AssetImage(TaiyoImages.apple),
              ),
              onPressed: () {},
            ),
          ),
      ],
    );
  }
}
