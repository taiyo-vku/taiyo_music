import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = false.obs;
  final rememberme = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());




}
