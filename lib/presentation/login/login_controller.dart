import 'package:ewise/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get intance => Get.find();

  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();

  final isLoading = false.obs;
  final AuthRepository _authRepo = Get.find<AuthRepository>();

  /* Future<void> login() async {
    try {
      isLoading.value = true;
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthRepository.instance;
      await auth.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
    }
  }  */

  //Call this Function from Design & it will do the rest
  Future<void> login() async {
    String? error = await AuthRepository.instance
        .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    } else {
      AuthRepository.instance
          .setInitialScreen(AuthRepository.instance.firebaseUser);
      Get.snackbar('Success', 'Login Berhasil!!');
    }
  }

  Future<void> loginUserWithGoogle() async {
    final User? userCredential = await _authRepo.loginUserWithGoogle();

    if (userCredential != null) {
      AuthRepository.instance
          .setInitialScreen(AuthRepository.instance.firebaseUser);
      Get.snackbar('Success', 'Login Berhasil!!');
    } else {
      // Handle the case when login with Google fails
      // You can show a message or take any specific action
      Get.snackbar("Google Login Error", "Failed to login with Google");
    }
  }
  
}
