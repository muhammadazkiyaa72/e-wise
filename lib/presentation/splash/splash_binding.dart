import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => SplashController(),
    );
  }
}
