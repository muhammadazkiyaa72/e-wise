import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/pickup/pickup_controller.dart';
import 'package:get/get.dart';

class PickupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => PickupController(),
    );
  }
}
