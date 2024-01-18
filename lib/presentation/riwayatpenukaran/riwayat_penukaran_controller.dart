import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewise/data/model/riwayat_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RiwayatPenukaranController extends GetxController {
  RxList<RiwayatModel> riwayatPoinList = <RiwayatModel>[].obs;
  RxList<RiwayatModel> riwayatPoinListMasuk = <RiwayatModel>[].obs;
  RxList<RiwayatModel> riwayatPoinListKeluar = <RiwayatModel>[].obs;

  Future<void> fetchRiwayatPoin() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('riwayat').get();

      riwayatPoinList.assignAll(querySnapshot.docs
          .map((doc) => RiwayatModel.fromSnapshot(doc))
          .toList());
      update();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching riwayat poin: $e");
      }
    }
  }

  Future<void> fetchRiwayatPoinMasuk() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('riwayat')
          .where('tukar', isEqualTo: false)
          .get();

      riwayatPoinListMasuk.assignAll(querySnapshot.docs
          .map((doc) => RiwayatModel.fromSnapshot(doc))
          .toList());
      update();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching riwayat poin masuk: $e");
      }
    }
  }

  void fetchRiwayatPoinKeluar() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('riwayat')
          .where('tukar', isEqualTo: true)
          .get();

      riwayatPoinListKeluar.assignAll(querySnapshot.docs
          .map((doc) => RiwayatModel.fromSnapshot(doc))
          .toList());
      update();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching riwayat poin keluar: $e");
      }
    }
  }
}
