import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final _authRepo = Get.find<AuthRepository>();
  final _userRepo = Get.put(UserRepository());
  final GoogleSignIn _googleSignIn = GoogleSignIn();
   RxDouble userPoints = 0.0.obs;

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
  Future<void> updateUserPoints() async {
    final userEmail = _authRepo.firebaseUser?.email;
    if (userEmail != null) {
      final points = await _userRepo.getUserPoints(userEmail);
      userPoints.value = points;
    }
  }
}
