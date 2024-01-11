import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
