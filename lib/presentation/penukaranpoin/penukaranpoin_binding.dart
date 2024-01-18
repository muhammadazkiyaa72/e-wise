import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin_controller.dart';
import 'package:get/get.dart';

class PenukaranPoinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => PenukaranPoinController(),
    );
  }
}
