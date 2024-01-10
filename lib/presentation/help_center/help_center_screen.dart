import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/laporan/laporan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pusat Bantuan',
          style: Styles.blackTextStyle.copyWith(
            fontWeight: AppFontWeight.semiBold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Center(
                child: Image.asset(
                  'assets/icons/ic_help_center.png',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 69,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const LaporanScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_report.png',
                          width: 60,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Laporkan',
                          style: Styles.blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: AppFontWeight.medium,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: AppColors.n40,
                      weight: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_telp.png',
                          width: 60,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Hubungi Kami',
                          style: Styles.blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: AppFontWeight.medium,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: AppColors.n40,
                      weight: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_faq.png',
                          width: 60,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'FAQ',
                          style: Styles.blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: AppFontWeight.medium,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right,
                      color: AppColors.n40,
                      weight: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
