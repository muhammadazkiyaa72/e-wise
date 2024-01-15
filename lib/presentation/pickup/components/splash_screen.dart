import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class SplashScreenMaps extends StatelessWidget {
  const SplashScreenMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/maps-splash-screen.png',
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Mencari lokasi kamu saat ini...',
              style: Styles.primaryTextStyle
                  .copyWith(fontSize: 10, fontWeight: AppFontWeight.semiBold),
            ),
          ],
        ),
      ),
    );
  }
}
