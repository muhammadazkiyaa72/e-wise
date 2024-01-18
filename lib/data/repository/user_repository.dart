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

  Future<PointModel> getUserWisePoints(String userEmail) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('wisepoints')
          .where('idUser', isEqualTo: userEmail)
          .get();

      if (userDoc.docs.isNotEmpty) {
        final userData = userDoc.docs.first.data();
        return PointModel.fromSnapshot(
            userData as DocumentSnapshot<Map<String, dynamic>>);
      } else {
        // Return a default value or handle the case when the user document is not found
        return PointModel(point: 0, masuk: 0, keluar: 0, idUser: userEmail);
      }
    } catch (e) {
      print('Error getting user wise points: $e');
      // Handle the error as needed
      return PointModel(point: 0, masuk: 0, keluar: 0, idUser: userEmail);
    }
  }
}
