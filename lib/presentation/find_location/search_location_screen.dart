import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/find_location/find_location_controller.dart';
import 'package:ewise/presentation/find_location/find_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final findLocationController = Get.put(FindLocationController());
// Menggunakan Future.delayed untuk mensimulasikan pengambilan data.
    Future.delayed(const Duration(seconds: 6), () {
      // Setelah pengambilan data, pindah ke FindLocationScreen.
      findLocationController.getCurrentLocation();
      findLocationController.getUserLocationDetails();
      findLocationController.fetchEbankDataForNearestPoints();
      findLocationController.nearestWasteCollectionPoint;
      findLocationController.nearestWasteCollectionPoints;
      findLocationController.initPage();
      Get.off(() => const FindLocationScreen());
    });
    return Container(
      color: AppColors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/ic_location_live.png',
              width: 100,
            ),
            const SizedBox(
              height: 21,
            ),
            Text(
              'Mencari lokasi kamu saat ini...',
              style: Styles.blackTextStyle.copyWith(
                fontSize: 13,
                fontWeight: AppFontWeight.medium,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
