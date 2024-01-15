import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/login/login_controller.dart';

import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => LoginController(),
    );
  }
}
