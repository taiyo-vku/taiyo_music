import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Variables
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  final imageUpLoading = false.obs;
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  // Fetch user Record
  // Future<void> fetchUserRecord() async {
  //   try {
  //     profileLoading.value = true;
  //     final user = await userRepository.fetchUserDetails();
  //     this.user(user);
  //   } catch (e) {
  //     user(UserModel.empty());
  //   } finally {
  //     profileLoading.value = false;
  //   }
  // }

  // Save user Record from any Registration provider
//   Future<void> saveUserRecord(UserCredential? userCredential) async {
//     try {
//       // First Update Rx User and then check if user data is already stored. if not store new a data.
//       await fetchUserRecord();

//       // If no record already stored.
//       if (user.value.id.isEmpty) {
//         if (userCredential != null) {
//           // Convert Name to First and Last Name
//           final nameParts =
//               UserModel.nameParts(userCredential.user!.displayName ?? '');
//           final username = UserModel.generationUsername(
//               userCredential.user!.displayName ?? '');

//           // Map Data
//           final user = UserModel(
//             id: userCredential.user!.uid,
//             firstName: nameParts[0],
//             lastName:
//                 nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
//             username: username,
//             email: userCredential.user!.email ?? '',
//             phoneNumber: userCredential.user!.phoneNumber ?? '',
//             profilePicture: userCredential.user!.photoURL ?? '',
//           );

//           // Save user data
//           await userRepository.saveUserRecord(user);
//         }
//       }
//     } catch (e) {
//       TaiyoLoaders.warningSnackBar(
//           title: 'Data not saved.',
//           mesage:
//               'Something went wrong while saving your information. You can re-save your data in your profile.');
//     }
//   }
// }
}
