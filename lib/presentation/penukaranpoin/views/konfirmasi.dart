import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/penukaranpoin/components/row_widget.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KonfirmasiPage extends StatefulWidget {
  final TabController tabController;
  const KonfirmasiPage({super.key, required this.tabController});

  @override
  State<KonfirmasiPage> createState() => _KonfirmasiPageState();
}

class _KonfirmasiPageState extends State<KonfirmasiPage> {
  @override
  Widget build(BuildContext context) {
    final PenukaranPoinController controller =
        Get.put(PenukaranPoinController());

    if (controller.nominal.value == 0.0) {
      return const Center(
        child: Text('Pilih Nominal Terlebih dahulu!'),
      );
    } else if (controller.akun.isEmpty && controller.ewallet.isEmpty) {
      return const Center(
        child: Text('Pilih E-Wallet Terlebih dahulu!'),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rincian Penarikan',
                  style: Styles.blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: AppFontWeight.semiBold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Perhatikan, anda akan melakukan penukaran poin dengan rincian berikut :',
                  style: Styles.blackTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                RowWidget(
                  label: 'Poin Ditukarkan',
                  value: ': ${controller.nominal} Poin',
                ),
                RowWidget(
                  label: 'Uang Tunai',
                  value: ': Rp  ${controller.nominal}',
                ),
                RowWidget(
                  label: 'e-Wallet',
                  value: ': ${controller.ewallet}',
                ),
                RowWidget(
                  label: 'Akun e-Wallet',
                  value: ': ${controller.akun}',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    'Anda tidak lagi dapat mengubah nominal ataupun metode penarikan setelah melakukan konfirmasi.',
                    textAlign: TextAlign.justify,
                    style: Styles.blackTextStyle.copyWith(fontSize: 12)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 60.0),
              child: ElevatedButton(
                  onPressed: () async {
                    await controller.konfirmasiPenukaran().whenComplete(() {
                      Get.back();
                      Get.snackbar('Success', 'Berhasil Tukar Poin');
                    });
                  },
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(5),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColors.p40),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 8))),
                  child: Center(
                    child: Text(
                      'Konfirmasi',
                      style: Styles.whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: AppFontWeight.medium),
                    ),
                  )),
            ),
          ],
        ),
      );
    }
  }
}
