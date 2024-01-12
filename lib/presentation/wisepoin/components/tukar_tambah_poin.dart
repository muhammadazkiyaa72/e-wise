import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin.dart';
import 'package:ewise/presentation/pickup/pickup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TukarTambahPoin extends StatefulWidget {
  final String iconPath;
  final bool tukar;

  const TukarTambahPoin(
      {super.key, required this.iconPath, required this.tukar});

  @override
  State<TukarTambahPoin> createState() => _TukarTambahPoinState();
}

class _TukarTambahPoinState extends State<TukarTambahPoin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(widget.tukar ? const PenukaranPoin() : const PickupPage());
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(color: Color(0xFFFEF7FF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // icon tukar poin
                SizedBox(
                    height: 50,
                    child: ImageIcon(
                      AssetImage(widget.iconPath),
                      size: 50,
                      color: AppColors.p40,
                    )),

                const SizedBox(
                  width: 15,
                ),

                // teks tukar poin
                Text(
                  widget.tukar ? "Tukar Poin" : "Tambah Poin",
                  style: Styles.blackTextStyle,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  widget.tukar ? "Penarikan" : "PickUp",
                  style: Styles.blackTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12.5,
                  weight: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
