import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/homepage/home_controller.dart';

import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
