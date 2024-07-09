import 'package:flutter/material.dart';
import '../../../../../utils/constants/images_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';

class TaiyoLoginHeader extends StatelessWidget {
  const TaiyoLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          image: AssetImage(TaiyoImages.logo),
        ),
        Text(TaiyoTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TaiyoSizes.sm),
        Text(TaiyoTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
