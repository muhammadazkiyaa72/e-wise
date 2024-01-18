import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/find_location/find_location_controller.dart';
import 'package:get/get.dart';

class FindLocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => FindLocationController(),
    );
  }
}
