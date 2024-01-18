import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final _authRepo = Get.find<AuthRepository>();
  final _userRepo = Get.put(UserRepository());
  RxDouble userPoints = 0.0.obs;

  Future<String?> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    final email = _authRepo.firebaseUser?.email;
    if (email != null && user != null) {
      String? displayName = user.displayName;

      // Use a different name for the second 'user' variable
      final userDetails = await _userRepo.getUserDetails(email);

      return userDetails?.fullName ?? displayName;
    } else {
      return null;
    }
  }

  Future<void> updateUserPoints() async {
    final userEmail = _authRepo.firebaseUser?.email;
    if (userEmail != null) {
      final points = await _userRepo.getUserPoints(userEmail);
      userPoints.value = points;
      update();
    }
  }
}
