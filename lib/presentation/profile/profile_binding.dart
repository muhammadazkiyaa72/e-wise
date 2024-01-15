import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => ProfileController(),
    );
  }
}
