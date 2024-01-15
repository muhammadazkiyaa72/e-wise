import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => RegisterController(),
    );
  }
}
