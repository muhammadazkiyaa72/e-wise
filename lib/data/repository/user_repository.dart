import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewise/data/model/point_model.dart';
import 'package:ewise/data/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    try {
      await _db.collection("Users").add(user.toJson());
      Get.snackbar(
        "Success",
        "Your account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
      // Return a default value or rethrow the error
      return Future.error("An error occurred while creating the user");
    }
  }

  Future<UserModel?> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();

    if (snapshot.docs.isNotEmpty) {
      final userData = UserModel.fromSnapshot(snapshot.docs.first);
      return userData;
    } else {
      return null; // Handle the case where no document matches the query
    }
  }

  Future<void> createPoints(PointModel pointModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('points')
          .add(pointModel.toJson());
    } catch (error) {
      if (kDebugMode) {
        print("Error in createPoints: $error");
      }
      // Handle the error or rethrow it if needed
    }
  }
  Future<double> getUserPoints(String userEmail) async {
    try {
      // Query the 'points' collection in Firestore
      final querySnapshot = await FirebaseFirestore.instance
          .collection('points')
          .where('idUser', isEqualTo: userEmail)
          .get();

      // If there is a document, return the points value, else return 0
      if (querySnapshot.docs.isNotEmpty) {
        final points = querySnapshot.docs.first.data()['point'] as double;
        return points;
      } else {
        return 0;
      }
    } catch (error) {
      print("Error in getUserPoints: $error");
      // Handle the error or rethrow it if needed
      return 0;
    }
  }
}
