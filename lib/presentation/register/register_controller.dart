import 'package:ewise/data/model/point_model.dart';
import 'package:ewise/data/model/user_model.dart';
import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey();
  final isLoading = false.obs;

  final userRepository = Get.put(UserRepository());

  void registerUser(String email, String password) {
    AuthRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    try {
      await userRepository.createUser(user);

      // Note: Firebase authentication is asynchronous, so you should wait for the completion
      await AuthRepository.instance
          .createUserWithEmailAndPassword(user.email, user.password);

      AuthRepository.instance
          .setInitialScreen(AuthRepository.instance.firebaseUser);

      // Award points to the user
      final pointModel = PointModel(
          idUser: user.email, point: 10); // You can adjust the points as needed
      await userRepository.createPoints(pointModel);
    } catch (error) {
      print("Error in createUser: $error");
      // Handle the error or rethrow it if needed
    }
  }
}
