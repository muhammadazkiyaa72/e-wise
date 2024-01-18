import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/pickup/pickup.dart';
import 'package:ewise/presentation/pickup/pickup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenMaps extends StatefulWidget {
  const SplashScreenMaps({super.key});

  @override
  State<SplashScreenMaps> createState() => _SplashScreenMapsState();
}

class _SplashScreenMapsState extends State<SplashScreenMaps> {
  final PickupController pickupController = Get.put(PickupController());

  @override
  void initState() {
    super.initState();
    initPage();
  }

  Future<void> initPage() async {
    await pickupController.getCurrentLocation();
    await pickupController.getUserLocationDetails();
    pickupController.findNearestWasteCollectionPoints();
    pickupController.update();
    setState(() {});

    if (pickupController.currentLocation != null &&
        pickupController.nearestWasteCollectionPoint.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 6));

      Get.off(() => const PickupPage());
    } else {
      // Handle the case where location data is not available
      // You may want to show an error message or retry the operation
      print("Error: Location data not available");
    }
  }

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
