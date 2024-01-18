import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran_controller.dart';
import 'package:get/get.dart';

class RiwayatPenukaranBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => RiwayatPenukaranController(),
    );
  }
}
