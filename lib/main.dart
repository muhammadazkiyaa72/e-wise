import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/firebase_options.dart';
import 'package:ewise/presentation/homepage/homepage_screen.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:ewise/presentation/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Wise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: AuthRepository.instance.firebaseUserStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator or splash screen
            return const CircularProgressIndicator();
          } else {
            // Authentication state has been initialized
            return snapshot.hasData
                ? const HomePageScreen()
                : const SplashScreen();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
