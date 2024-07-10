import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/features/authentication/screens/login/login.dart';

import 'binding/general_binding.dart';
import 'localization/l10n.dart';
import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Taiyo Music",
      themeMode: ThemeMode.system,
      theme: TaiyoTheme.lightTheme,
      darkTheme: TaiyoTheme.darkTheme,
      initialBinding: GeneralBinding(),
      supportedLocales: L10n.all,

      //getPages: AppRoutes.pages,
      // TODO : LOGIN <===>
      home: const Scaffold(
        backgroundColor: TaiyoColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
