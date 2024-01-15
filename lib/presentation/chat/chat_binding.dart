import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/presentation/chat/chat_controller.dart';

import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(
      () => ChatController(),
    );
  }
}
