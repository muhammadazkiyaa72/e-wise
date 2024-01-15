import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/about_ewise/about_ewise_screen.dart';
import 'package:ewise/presentation/find_location/find_location_screen.dart';
import 'package:ewise/presentation/help_center/help_center_screen.dart';
import 'package:ewise/presentation/notification/notification.dart';
import 'package:ewise/presentation/profile/profile_controller.dart';
import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran.dart';
import 'package:ewise/presentation/widgets/profile_widget.dart';
import 'package:ewise/presentation/wisepoin/wisepoin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                          FutureBuilder<String?>(
                            future: controller.getUserData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                final displayName = snapshot.data;
                                final userEmail = controller.getUserEmail();
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      displayName ?? '',
                                      style: Styles.blackTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: AppFontWeight.semiBold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      userEmail ??
                                          '', // You can replace this with the actual email
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
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
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
              ProfileWidget(
                iconAsset: 'assets/icons/ic_setting.png',
                nameMenu: 'Pengaturan',
                onPressed: () {
                  Get.to(const FindLocationScreen());
                },
              ),
              ProfileWidget(
                iconAsset: 'assets/icons/ic_WisePoint.png',
                nameMenu: 'WisePoin Saya',
                onPressed: () {
                  Get.to(const WisePoint());
                },
              ),
              ProfileWidget(
                iconAsset: 'assets/icons/ic_history.png',
                nameMenu: 'Riwayat pickup',
                onPressed: () {
                  Get.to(const RiwayatPenukaran());
                },
              ),
              ProfileWidget(
                iconAsset: 'assets/icons/ic_help.png',
                nameMenu: 'Bantuan dan Laporan',
                onPressed: () {
                  Get.to(const HelpCenterScreen());
                },
              ),
              ProfileWidget(
                iconAsset: 'assets/icons/ic_location_on.png',
                nameMenu: 'Alamat Favorit',
                onPressed: () {
                  Get.to(const HelpCenterScreen());
                },
              ),
              ProfileWidget(
                iconAsset: 'assets/icons/ic_notification.png',
                nameMenu: 'Notifikasi',
                onPressed: () {
                  Get.to(const NotificationPage());
                },
              ),
              ProfileWidget(
                iconAsset: 'assets/icons/ic_information.png',
                nameMenu: 'Tentang e-Wise',
                onPressed: () {
                  Get.to(const AboutEWise());
                },
              ),
              ProfileWidget(
                iconAsset: 'assets/icons/ic_logout.png',
                nameMenu: 'Logout',
                onPressed: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
