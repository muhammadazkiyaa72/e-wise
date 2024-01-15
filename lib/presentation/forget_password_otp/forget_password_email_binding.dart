import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/forget_password_otp/forget_password_email_controller.dart';


import 'package:get/get.dart';

class ForgetPasswordEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => ForgetPasswordEmailController(),
    );
  }
}
