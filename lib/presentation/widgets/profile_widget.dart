import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String iconAsset;
  final String nameMenu;
  final VoidCallback onPressed;
  const ProfileWidget({
    super.key,
    required this.iconAsset,
    required this.nameMenu,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Image.asset(
                  iconAsset,
                  width: 30,
                ),
                const SizedBox(
                  width: 19,
                ),
                Text(
                  nameMenu,
                  style: Styles.blackTextStyle.copyWith(
                    fontWeight: AppFontWeight.medium,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: double.infinity,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFCAC4D0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
