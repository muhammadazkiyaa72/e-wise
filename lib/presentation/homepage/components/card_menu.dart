import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/education/education_screen.dart';
import 'package:ewise/presentation/find_location/find_location_screen.dart';
import 'package:ewise/presentation/pickup/pickup.dart';
import 'package:ewise/presentation/wisepoin/wisepoin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardMenu extends StatefulWidget {
  final double elevationShadow = 5;
  final double fontSize = 10;

  static List cardMenu = [
    {
      'imagePath': 'assets/img/icon-park-outline_delivery.png',
      'name': 'Pickup',
      'route': const PickupPage()
    },
    {
      'imagePath': 'assets/img/icon-find-e-bank.png',
      'name': 'Lokasi e-Bank',
      'route': const FindLocationScreen()
    },
    {
      'imagePath': 'assets/img/icon-feature-wisepoint.png',
      'name': 'WisePoint',
      'route': const WisePoint()
    },
    {
      'imagePath': 'assets/img/icon-education.png',
      'name': 'Education',
      'route': const EducationScreen()
    }
  ];

  const CardMenu({super.key});

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: CardMenu.cardMenu.map((e) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(e['route']);
              },
              child: Material(
                elevation: widget.elevationShadow,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(e['imagePath'])),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              e['name'],
              style: Styles.primaryTextStyle.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                  fontSize: widget.fontSize),
            )
          ],
        );
      }).toList(),
    );
  }
}
