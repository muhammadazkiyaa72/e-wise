import 'package:ewise/presentation/chat/chat_binding.dart';
import 'package:ewise/presentation/chat/chat_screen.dart';
import 'package:ewise/presentation/education/education_screen.dart';
import 'package:ewise/presentation/find_location/find_location_binding.dart';
import 'package:ewise/presentation/find_location/find_location_screen.dart';
import 'package:ewise/presentation/forget_password_otp/forget_password_email_binding.dart';
import 'package:ewise/presentation/forget_password_otp/forget_password_email_page.dart';
import 'package:ewise/presentation/homepage/components/homepage.dart';
import 'package:ewise/presentation/homepage/home_binding.dart';
import 'package:ewise/presentation/homepage/homepage_screen.dart';
import 'package:ewise/presentation/login/login_binding.dart';
import 'package:ewise/presentation/pickup/pickup_binding.dart';
import 'package:ewise/presentation/profile/profile_binding.dart';
import 'package:ewise/presentation/profile/profile_screen.dart';
import 'package:ewise/presentation/register/register_binding.dart';
import 'package:ewise/presentation/register/register_screen.dart';
import 'package:ewise/presentation/splash/splash_binding.dart';
import 'package:ewise/presentation/wisepoin/wisepoin.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:ewise/presentation/notification/notification.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin.dart';
import 'package:ewise/presentation/pickup/pickup.dart';

import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran.dart';
import 'package:ewise/presentation/splash/splash_screen.dart';
import 'package:ewise/presentation/status_pickup/status_pickup_screen.dart';
import 'package:ewise/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
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
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.findLocation,
      page: () => const FindLocationScreen(),
      binding: FindLocationBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.homepage,
      page: () => const HomePageScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.homepagescreen,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.notification,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: Routes.penukaranPoin,
      page: () => const PenukaranPoin(),
    ),
    GetPage(
      name: Routes.pickup,
      page: () => const PickupPage(),
      binding: PickupBinding(),
    ),
    GetPage(
      name: Routes.riwayatPenukaran,
      page: () => const RiwayatPenukaran(),
    ),
    GetPage(
      name: Routes.wisepoin,
      page: () => const WisePoint(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgetPasswordEmailPage(),
      binding: ForgetPasswordEmailBinding(),
    ),
  ];
}
