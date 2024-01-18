import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewise/data/model/riwayat_model.dart';
import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/data/repository/user_repository.dart';
import 'package:get/get.dart';

class PenukaranPoinController extends GetxController {
  final _authRepo = Get.find<AuthRepository>();
  final _userRepo = Get.put(UserRepository());

  RxDouble userPoints = 0.0.obs;
  RxDouble poinMasuk = 0.0.obs;
  RxDouble poinKeluar = 0.0.obs;
  RxDouble selectedNominal = 0.0.obs;
  RxDouble nominal = 0.0.obs;
  RxString ewallet = ''.obs;
  RxString akun = ''.obs;

  Future<double> getUserPoints(String userEmail) async {
    try {
      // Query Firestore to get user points
      var userPointsQuery = await FirebaseFirestore.instance
          .collection('points')
          .where('idUser', isEqualTo: userEmail)
          .get();

      if (userPointsQuery.docs.isNotEmpty) {
        // Get the first document (assuming the email is unique)
        var userPointsData = userPointsQuery.docs.first.data();
        var points = userPointsData['point'] ?? 0.0;
        return points.toDouble();
      } else {
        // If no document found, return 0 points or handle it as needed
        return 0.0;
      }
    } catch (e) {
      // Handle the error appropriately
      print("Error fetching user points: $e");
      return 0.0;
    }
  }

  Future<void> updateUserPoints() async {
    final userEmail = _authRepo.firebaseUser?.email;
    if (userEmail != null) {
      final points = await _userRepo.getUserPoints(userEmail);
      final wisePointData = await _userRepo.getUserWisePoints(userEmail);

      userPoints.value = points;
      poinMasuk.value = wisePointData.masuk;
      poinKeluar.value = wisePointData.keluar;

      update();
    }
  }

  void updateSelectedNominal(double nominal) {
    selectedNominal.value = nominal;
  }

  void updateSelectedWallet(String walletName, String walletNumber) {
    ewallet.value = walletName;
    akun.value = walletNumber;
  }

  Future<void> konfirmasiPenukaran() async {
    final userEmail = _authRepo.firebaseUser?.email;
    var points;
    if (userEmail != null) {
      // Update user points
      var userPointsQuery = await FirebaseFirestore.instance
          .collection('points')
          .where('idUser', isEqualTo: userEmail)
          .get();
      var userPointsData = userPointsQuery.docs.first.data();
      points = userPointsData['keluar'] ?? 0.0;

      await updateUserPoints();

      // Deduct the selected nominal from user points
      final newPoints = userPoints.value - selectedNominal.value;

      // Update user points in Firestore
      await updateUserPoints();

      // Update the existing document in the "points" collection
      await FirebaseFirestore.instance
          .collection('points')
          .doc(userPointsQuery.docs.first.id) // Specify the document ID
          .update({
        'point': newPoints,
        'keluar': points + selectedNominal.value,
      });

      final riwayatDoc = RiwayatModel(
        idUser: userEmail,
        pointTukar: selectedNominal.value,
        uang: selectedNominal.value,
        ewallete: ewallet.value,
        akun: akun.value,
        tukar: true,
        timestamp: DateTime.now(),
      ).toJson();

      await FirebaseFirestore.instance.collection('riwayat').add(riwayatDoc);

      // Clear selected nominal, ewallet, and akun
      selectedNominal.value = 0.0;
      ewallet.value = '';
      akun.value = '';
    }
  }
}
