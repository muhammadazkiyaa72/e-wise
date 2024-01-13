import 'package:ewise/presentation/help_center/help_center_screen.dart';
import 'package:ewise/presentation/notification/notification.dart';
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
  final double heroContainerHeight = 250;

  final double wisePointCardHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.p50,
          foregroundColor: AppColors.white,
          title: Text(
            "Hai, Zahid!",
            style: Styles.whiteTextStyle.copyWith(fontSize: 14),
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
                      height: heroContainerHeight,
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
                          const Informasi(),
                        ],
                      ),
                    )
                  ]),

              // WisePoint
              Positioned(
                  top: heroContainerHeight - wisePointCardHeight / 2,
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
