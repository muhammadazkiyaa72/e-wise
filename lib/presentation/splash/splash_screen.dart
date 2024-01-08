import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    SplashController().delayAndNavigate();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/logo.png',
            width: 138,
            height: 201,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "e-Wise",
            style: Styles.primaryTextStyle.copyWith(
              decoration: TextDecoration.none,
              fontWeight: AppFontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Text(
            "Dispose e-waste wisely",
            style: Styles.blackTextStyle.copyWith(
              decoration: TextDecoration.none,
              fontWeight: AppFontWeight.medium,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }
}
