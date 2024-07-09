import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch

  /*------------------------------------------- EMAIL & PASSWORD LOGIN --------------------------------------------*/
  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw '';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw '';
    }
  }

  ///[EmailVerification] -MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw '';
    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [ReAuthentication] - RE AUTHENTICATION
  Future<void> reAuthenticationEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } catch (e) {
      throw '';
    }
  }

  ///[LogoutUser] -- LOGOUT
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw '';
    }
  }
}
