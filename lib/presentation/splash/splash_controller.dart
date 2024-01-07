import 'package:ewise/presentation/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void delayAndNavigate() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.off(() => const LoginScreen());
  }
}
