import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/data/repository/user_repository.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.find<AuthRepository>();
  final _userRepo = Get.put(UserRepository());

  String? getUserEmail() {
    return _authRepo.firebaseUser?.email;
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> getUserData() async {
    GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
    final email = _authRepo.firebaseUser?.email;
    if (email != null) {
      String? displayName = googleUser?.displayName;

      // Use a different name for the second 'user' variable
      final userDetails = await _userRepo.getUserDetails(email);

      return userDetails?.fullName ?? displayName;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar("Error", "Login to continue");
      });
      return null;
    }
  }

  Future<void> logout() async {
    await AuthRepository.instance.logout();
    Get.offAll(const LoginScreen());
    Get.snackbar('Success', 'Logout Berhasil!');
  }
}
