import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app/data/repositories/authentication/auth_repository.dart';
import '../../../features/personal/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJSon());
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to fetch user details base on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Something went wrong.Please try again.';
    }
  }

  // Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      await _db
          .collection("Users")
          .doc(userModel.id)
          .update(userModel.toJSon());
    } catch (e) {
      throw 'Something went wrong.Please try again.';
    }
  }

  // Upate any field in specify Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthRepository.instance.authUser!.uid)
          .update(json);
    } catch (e) {
      throw 'Something went wrong.Please try again.';
    }
  }

  // Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } catch (e) {
      throw 'Something went wrong.Please try again.';
    }
  }

  // Upload any Image aka avatar
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));

      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Some thing went wrong. Please try again.';
    }
  }
}
