import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/help_center/help_center_screen.dart';
import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran.dart';
import 'package:ewise/presentation/wisepoin/components/detail_poin.dart';
import 'package:ewise/presentation/wisepoin/components/poin_card.dart';
import 'package:ewise/presentation/wisepoin/components/tukar_tambah_poin.dart';
import 'package:ewise/presentation/wisepoin/wisepoin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WisePoint extends StatefulWidget {
  const WisePoint({super.key});

  @override
  State<WisePoint> createState() => _WisePointState();
}

class _WisePointState extends State<WisePoint> {
  final WisepointController controller = Get.put(WisepointController());
  @override
  void initState() {
    super.initState();

    setState(() {
      controller.updateUserPoints();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.p50,
        foregroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'WisePoint',
          style: Styles.whiteTextStyle.copyWith(
            fontWeight: AppFontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Get.to(const HelpCenterScreen());
              },
              icon: const Icon(Icons.help_outline_outlined))
        ],
      ),
      body: FutureBuilder(
        // Use FutureBuilder to wait for the asynchronous operation
        future: controller.updateUserPoints(),
        builder: (context, snapshot) {
          // Check if the future is complete
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Banner/card poin
                  Stack(
                    children: [
                      Container(
                          // ... your existing container code ...
                          ),
                      const Positioned(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: PoinCard(),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 30),

                  // tukar poin
                  const TukarTambahPoin(
                      iconPath: 'assets/img/icon-tukar-poin.png', tukar: true),

                  const SizedBox(height: 30),

                  // tambah poin
                  const TukarTambahPoin(
                      iconPath: 'assets/img/icon-tambah-poin.png',
                      tukar: false),

                  const SizedBox(height: 30),

                  // analisa wisepoin
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Analisa WisePoint",
                            style: Styles.blackTextStyle.copyWith(
                              fontWeight: AppFontWeight.semiBold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Get.to(const RiwayatPenukaranScreen());
                          },
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(() => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DetailPoin(
                                            poinMasuk: true,
                                            pointValue:
                                                controller.poinMasuk.value),
                                        DetailPoin(
                                            poinMasuk: false,
                                            pointValue:
                                                controller.poinKeluar.value),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Selisih : ',
                                          style: Styles.blackTextStyle.copyWith(
                                              fontWeight:
                                                  AppFontWeight.semiBold,
                                              fontSize: 14.0),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${(controller.poinMasuk.value - controller.poinKeluar.value).toInt()}',
                                              style: TextStyle(
                                                  color: AppColors.p40,
                                                  fontWeight:
                                                      AppFontWeight.semiBold,
                                                  fontSize: 14.0),
                                            )
                                          ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            // If the future is not complete, show a loading indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
