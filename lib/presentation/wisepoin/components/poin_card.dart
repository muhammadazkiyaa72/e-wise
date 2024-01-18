import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran.dart';
import 'package:ewise/presentation/wisepoin/wisepoin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoinCard extends StatefulWidget {
  const PoinCard({super.key});

  @override
  State<PoinCard> createState() => _PoinCardState();
}

class _PoinCardState extends State<PoinCard> {
  final WisepointController controller = Get.put(WisepointController());
  @override
  void initState() {
    super.initState();
    controller.updateUserPoints();
    controller.updateUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.p90,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Poin Anda',
                    style: TextStyle(
                        color: AppColors.p30,
                        fontSize: 14,
                        fontWeight: AppFontWeight.semiBold)),
                TextButton(
                  onPressed: () {
                    Get.to(const RiwayatPenukaranScreen());
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Riwayat',
                    style: TextStyle(
                        color: AppColors.p40,
                        fontSize: 14,
                        fontWeight: AppFontWeight.medium,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.p40),
                  ),
                )
              ],
            ),
            Obx(
              () => Text(
                '${controller.userPoints.toInt()}',
                style: Styles.primaryTextStyle.copyWith(
                  fontSize: 40,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ),
            Obx(() => Text(
                  '${controller.userName}',
                  style: TextStyle(
                      color: AppColors.p30,
                      fontSize: 14,
                      fontWeight: AppFontWeight.semiBold),
                ))
          ],
        ),
      ),
    );
  }
}
