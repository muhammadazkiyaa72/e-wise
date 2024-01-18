import 'package:ewise/data/repository/auth_repository.dart';

import 'package:ewise/presentation/status_pickup/status_pickup_controller.dart';
import 'package:get/get.dart';

class StatusPickupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => StatusPickupController(),
    );
  }
}
