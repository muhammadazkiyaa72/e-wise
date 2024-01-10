import 'package:ewise/presentation/chat/chat_screen.dart';
import 'package:ewise/presentation/education/education_screen.dart';
import 'package:ewise/presentation/find_location/find_location_binding.dart';
import 'package:ewise/presentation/find_location/find_location_screen.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:ewise/presentation/splash/splash_screen.dart';
import 'package:ewise/presentation/status_pickup/status_pickup_screen.dart';
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
    GetPage(
      name: Routes.education,
      page: () => const EducationScreen(),
    ),
    GetPage(
      name: Routes.statusPickup,
      page: () => const StatusPickupScreen(),
    ),
    GetPage(
      name: Routes.chat,
      page: () => const ChatScreen(),
    ),
    GetPage(
      name: Routes.findLocation,
      page: () => const FindLocationScreen(),
      binding: FindLocationBinding(),
    ),
  ];
}
