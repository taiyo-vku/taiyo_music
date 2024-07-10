import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_app/features/authentication/screens/login/login.dart';
import 'package:music_app/utils/constants/text_string.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    screenRedirect();
  }

  screenRedirect() {
    // final user = _auth.currentUser;
    // if (user != null) {
    //   if (user.emailVerified) {}
    // } else {
    //   Get.offAll(() => const LoginScreen());
    // }

    Get.offAll(() => const LoginScreen());
  }

  /*------------------------------------------- EMAIL & PASSWORD LOGIN --------------------------------------------*/
  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw TaiyoTexts.error;
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw TaiyoTexts.error;
    }
  }

  ///[EmailVerification] -MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw TaiyoTexts.error;
    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw TaiyoTexts.error;
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
