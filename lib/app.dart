// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      //initialBinding: GeneralBindings(),
      //getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: TaiyoColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
