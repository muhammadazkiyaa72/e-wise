import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:get/get.dart';

class ForgetPasswordEmailController extends GetxController {
  static ForgetPasswordEmailController get instance => Get.find();

  final _authRepo = Get.find<AuthRepository>();

  Future<void> sendPasswordResetEmail(String email) async {
    await _authRepo.sendPasswordResetEmail(email);
    Get.offAll(const LoginScreen());
  }
}
