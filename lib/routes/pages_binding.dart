import 'package:ewise/presentation/login/login_screen.dart';
import 'package:ewise/presentation/splash/splash_screen.dart';
import 'package:ewise/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
  ];
}
