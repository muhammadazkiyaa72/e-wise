import 'package:ewise/presentation/help_center/help_center_screen.dart';
import 'package:ewise/presentation/homepage/home_controller.dart';
import 'package:ewise/presentation/notification/notification.dart';
import 'package:ewise/presentation/widgets/berita_widget.dart';
import 'package:flutter/material.dart';
import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/homepage/components/card_menu.dart';
import 'package:ewise/presentation/homepage/components/infomasi.dart';
import 'package:ewise/presentation/homepage/components/slide_banner.dart';
import 'package:ewise/presentation/homepage/components/wise_point.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri url4 = Uri.parse(
      "https://www.kompas.id/baca/metro/2023/07/13/75-tonsampah-elektronik-dibuang-di-jakarta-setiap-hari");
  final Uri url5 = Uri.parse(
      "https://yoursay.suara.com/kolom/2023/04/18/104520/dampak-buruk-yang-tersembunyi-dari-e-waste-kasus-kabut-elektronik-di-cina");
  final Uri url6 = Uri.parse(
      "https://bandungbergerak.id/article/detail/159172/menilik-peran-komunitas-e-waste-bandung-dalam-mengelola-limbah-elektronik");
  final double heroContainerHeight = 280;

  final double wisePointCardHeight = 50;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.p50,
          foregroundColor: AppColors.white,
          title: FutureBuilder<String?>(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                  "Hai, Loading...",
                  style: Styles.whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppFontWeight.medium,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(
                  "Hai, Error",
                  style: Styles.whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppFontWeight.medium,
                  ),
                );
              } else if (snapshot.hasData) {
                return Text(
                  "Hai, ${snapshot.data}!",
                  style: Styles.whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: AppFontWeight.medium,
                  ),
                );
              } else {
                return const Text("Hai, User!");
              }
            },
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Get.to(const HelpCenterScreen());
                },
                icon: const Icon(Icons.help_outlined)),
            IconButton(
                onPressed: () {
                  Get.to(const NotificationPage());
                },
                icon: const Icon(Icons.notifications_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // hero
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: AppColors.p50,
                      ),
                      height: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 450
                          : heroContainerHeight,
                      child: const SlideBanner(),
                    ),

                    // menu
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Menu",
                              style: Styles.primaryTextStyle.copyWith(
                                fontWeight: AppFontWeight.semiBold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          // card
                          const CardMenu(),

                          const SizedBox(
                            height: 20,
                          ),

                          // informasi
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Informasi",
                              style: Styles.primaryTextStyle.copyWith(
                                fontWeight: AppFontWeight.semiBold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          // Informasi
                          Informasi(
                            url2: url4,
                            judul:
                                'Setiap Hari, 75 Ton Sampah Elektronik Dibuang di Jakarta',
                            tanggal: '13 July 2023',
                            sumber: 'kompas.id',
                            assetImage: 'assets/img/berita.png',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Informasi(
                            url2: url5,
                            judul:
                                'Dampak Buruk yang Tersembunyi dari E-Waste: Kasus Kabut Elektronik di Cina',
                            tanggal: '18 April 2023',
                            sumber: 'yoursay.id',
                            assetImage: 'assets/img/berita2.png',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Informasi(
                            url2: url6,
                            judul:
                                'Menilik Peran Komunitas E-waste Bandung dalam Mengelola Limbah Elektronik',
                            tanggal: '7 Desember 2023',
                            sumber: 'Bandung Bergerak',
                            assetImage: 'assets/img/berita3.png',
                          ),
                        ],
                      ),
                    )
                  ]),

              // WisePoint
              Positioned(
                  top: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 450 - wisePointCardHeight / 2
                      : heroContainerHeight - wisePointCardHeight / 2,
                  child: SizedBox(
                    height: wisePointCardHeight,
                    width: 332,
                    child: const WisePoint(),
                  )),
            ],
          ),
        ));
  }
}
