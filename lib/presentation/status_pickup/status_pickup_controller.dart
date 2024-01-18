import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewise/data/model/pickup_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class StatusPickupController extends GetxController {
  RxList<PickupModel> riwayatPickupListKonfirmasi = <PickupModel>[].obs;
  RxList<PickupModel> riwayatPickupListPickup = <PickupModel>[].obs;
  RxList<PickupModel> riwayatPickupListSelesai = <PickupModel>[].obs;

  String generateRandomCode() {
    // Fungsi ini akan menghasilkan kode acak dengan panjang 6 karakter
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  Future<void> fetchRiwayatPickupKonfirmasi() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('pickups')
          .where('pickupStatus', isEqualTo: 'Konfirmasi')
          .get();

      riwayatPickupListKonfirmasi.assignAll(querySnapshot.docs
          .map((doc) => PickupModel.fromSnapshot(doc))
          .toList());

      // Menambahkan kode acak pada setiap PickupModel
      for (var pickup in riwayatPickupListKonfirmasi) {
        pickup.pickupId = generateRandomCode();
      }

      update();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching riwayat poin: $e");
      }
    }
  }

  Future<void> fetchRiwayatPickup() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('pickups')
          .where('pickupStatus', isEqualTo: 'Pikcup')
          .get();

      riwayatPickupListPickup.assignAll(querySnapshot.docs
          .map((doc) => PickupModel.fromSnapshot(doc))
          .toList());
      // Menambahkan kode acak pada setiap PickupModel
      for (var pickup in riwayatPickupListKonfirmasi) {
        pickup.pickupId = generateRandomCode();
      }
      update();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching riwayat poin masuk: $e");
      }
    }
  }

  void fetchRiwayatPickupSelesai() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('pickups')
          .where('pickupStatus', isEqualTo: 'Selesai')
          .get();

      riwayatPickupListSelesai.assignAll(querySnapshot.docs
          .map((doc) => PickupModel.fromSnapshot(doc))
          .toList());

      // Menambahkan kode acak pada setiap PickupModel
      for (var pickup in riwayatPickupListSelesai) {
        pickup.pickupId = generateRandomCode();
      }

      update();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching riwayat poin keluar: $e");
      }
    }
  }
}
