import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/homepage/homepage_screen.dart';
import 'package:ewise/presentation/penukaranpoin/components/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KonfirmasiPage extends StatelessWidget {
  const KonfirmasiPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                style: Styles.blackTextStyle
                    .copyWith(fontSize: 14, fontWeight: AppFontWeight.semiBold),
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
              const RowWidget(
                label: 'Poin Ditukarkan',
                value: ': 250 Poin',
              ),
              const RowWidget(
                label: 'Uang Tunai',
                value: ': Rp 5.000',
              ),
              const RowWidget(
                label: 'e-Wallet',
                value: ': Gopay',
              ),
              const RowWidget(
                label: 'Akun e-Wallet',
                value: ': +62813*******7971',
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
                onPressed: () {
                  Get.to(const HomePageScreen());
                },
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(5),
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
