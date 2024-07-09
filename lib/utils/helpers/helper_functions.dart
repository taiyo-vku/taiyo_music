import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../device/device_utility.dart';

class TaiyoHelperFunctions {
  static Color? getColor(String value) {
    switch (value) {
      case "Green":
        return Colors.green;
      case "Red":
        return Colors.red;
      case "Blue":
        return Colors.blue;
      case "Pink":
        return Colors.pink;
      case "Grey":
        return Colors.grey;
      case "Black":
        return Colors.black;
      case "Purple":
        return Colors.purple;
      case "White":
        return Colors.white;
      case "Orange":
        return Colors.orange;
      case "Yellow":
        return Colors.yellow;
      case "deepOrange":
        return Colors.deepOrange;
      case "Brown":
        return Colors.brown;
      case "Teal":
        return Colors.teal;
      case "Indigo":
        return Colors.indigo;
    }

    return null;
  }

  static void showSnakeBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Okay!!"),
              )
            ],
          );
        });
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
        context,
        TaiyoDeviceUtils.isIOS()
            ? CupertinoPageRoute(builder: (_) => screen)
            : MaterialPageRoute(builder: (_) => screen));
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrapLists = <Widget>[];

    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrapLists.add(Row(children: rowChildren));
    }
    return wrapLists;
  }
}
