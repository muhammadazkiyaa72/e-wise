import 'package:ewise/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class WisepoinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => WisepoinBinding(),
    );
  }
}
