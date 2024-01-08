import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: Styles.blackTextStyle.copyWith(
                fontSize: 25,
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: AppColors.p50,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Zahid Azmi Ibrahim',
                          style: Styles.blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                        ),
                        Text(
                          'zahid18@gmail.com',
                          style: Styles.blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: AppFontWeight.regular,
                          ),
                        ),
                        Text(
                          '+62812345678910',
                          style: Styles.blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: AppFontWeight.regular,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          width: 74,
                          height: 22,
                          color: AppColors.grey3,
                          child: Center(
                            child: Text(
                              'Zero waste',
                              style: Styles.blackTextStyle.copyWith(
                                fontSize: 11,
                                fontWeight: AppFontWeight.regular,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Image.asset(
                  'assets/icons/ic_edit.png',
                  height: 24,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              color: AppColors.grey2,
              width: double.infinity,
              height: 0.5,
            ),
            const ProfileWidget(
              iconAsset: 'assets/icons/ic_setting.png',
              nameMenu: 'Pengaturan',
            ),
            const ProfileWidget(
              iconAsset: 'assets/icons/ic_WisePoint.png',
              nameMenu: 'WisePoin Saya',
            ),
            const ProfileWidget(
              iconAsset: 'assets/icons/ic_history.png',
              nameMenu: 'Riwayat pickup',
            ),
            const ProfileWidget(
              iconAsset: 'assets/icons/ic_help.png',
              nameMenu: 'Bantuan dan Laporan',
            ),
            const ProfileWidget(
              iconAsset: 'assets/icons/ic_location_on.png',
              nameMenu: 'Alamat Favorit',
            ),
            const ProfileWidget(
              iconAsset: 'assets/icons/ic_notification.png',
              nameMenu: 'Notifikasi',
            ),
            const ProfileWidget(
              iconAsset: 'assets/icons/ic_information.png',
              nameMenu: 'Tentang e-Wise',
            ),
          ],
        ),
      ),
    );
  }
}
