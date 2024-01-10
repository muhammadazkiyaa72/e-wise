import 'package:ewise/presentation/find_location/find_location_controller.dart';
import 'package:get/get.dart';

class FindLocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FindLocationController(),
    );
  }
}
