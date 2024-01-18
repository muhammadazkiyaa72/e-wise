import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class WisepointController extends GetxController {
  final _authRepo = Get.find<AuthRepository>();
  final _userRepo = Get.put(UserRepository());

  RxDouble userPoints = 0.0.obs;
  RxDouble poinMasuk = 0.0.obs;
  RxDouble poinKeluar = 0.0.obs;
  RxString userName = ''.obs;

  Future<void> updateUserPoints() async {
    final userEmail = _authRepo.firebaseUser?.email;
    if (userEmail != null) {
      final points = await _userRepo.getUserPoints(userEmail);
      var userPointsQuery = await FirebaseFirestore.instance
          .collection('points')
          .where('idUser', isEqualTo: userEmail)
          .get();

      var userPointsData = userPointsQuery.docs.first.data();
      if (userPointsData.isNotEmpty) {
        var keluar = (userPointsData['keluar'] ?? 0).toDouble();
        var masuk = (userPointsData['masuk'] ?? 0).toDouble();

        userPoints.value = points;
        poinMasuk.value = masuk;
        poinKeluar.value = keluar;

        update();
      }
    }
  }

  Future<String?> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    final email = _authRepo.firebaseUser?.email;
    if (email != null || user != null) {
      String? displayName = user?.displayName;

      // Use a different name for the second 'user' variable
      final userDetails = await _userRepo.getUserDetails(email!);

      return userDetails?.fullName ?? displayName;
    } else {
      return null;
    }
  }

  Future<void> updateUserName() async {
    final name = await getUserData();
    userName.value = name ?? '';
    update();
  }
}
