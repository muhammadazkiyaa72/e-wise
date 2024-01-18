import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/homepage/home_controller.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WisePoint extends StatefulWidget {
  const WisePoint({super.key});

  @override
  State<WisePoint> createState() => _WisePointState();
}

class _WisePointState extends State<WisePoint> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.updateUserPoints();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/icon-wisepoint.png'),
                const SizedBox(
                  width: 12,
                ),
                Obx(() {
                  return Text(
                    "${controller.userPoints.toInt()}",
                    style: Styles.primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: AppFontWeight.semiBold,
                    ),
                  );
                }),
              ],
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(const PenukaranPoin());
              },
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: AppColors.p40, width: 2))),
                child: Center(
                    child: Text(
                  "Tukar Poin",
                  style: Styles.primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: AppFontWeight.regular),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
