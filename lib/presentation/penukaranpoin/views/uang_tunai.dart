// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin_controller.dart';
import 'package:ewise/presentation/wisepoin/components/poin_card.dart';

class UangTunaiPage extends StatefulWidget {
  final VoidCallback onNextTab;
  final TabController tabController;
  static List listUang = [
    5000,
    10000,
    15000,
    30000,
    40000,
    50000,
  ];

  const UangTunaiPage({
    Key? key,
    required this.tabController,
    required this.onNextTab,
  }) : super(key: key);

  @override
  State<UangTunaiPage> createState() => _UangTunaiPageState();
}

class _UangTunaiPageState extends State<UangTunaiPage> {
  final PenukaranPoinController controller = Get.put(PenukaranPoinController());
  @override
  void initState() {
    super.initState();
    controller.updateUserPoints();
  }

  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // card poin
              const PoinCard(),

              const SizedBox(
                height: 30,
              ),

              // uang tunai
              Text(
                'Uang Tunai',
                style: Styles.blackTextStyle
                    .copyWith(fontSize: 16, fontWeight: AppFontWeight.semiBold),
              ),

              const SizedBox(
                height: 25,
              ),

              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 96 / 40),
                itemCount: UangTunaiPage.listUang.length,
                itemBuilder: (context, index) {
                  bool isTapped = index == tappedIndex;
                  Color borderColor =
                      isTapped ? AppColors.p90 : const Color(0xFF79747E);
                  Color nominalColor =
                      isTapped ? AppColors.p90 : AppColors.black;

                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          tappedIndex = index;
                          if (tappedIndex != -1) {
                            // Call the method to update the selected nominal value
                            controller.updateSelectedNominal(double.parse(
                                UangTunaiPage.listUang[index].toString()));
                          }
                        });
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor)),
                        child: Center(
                          child: Text(
                              'Rp ' + UangTunaiPage.listUang[index].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: nominalColor,
                              )),
                        ),
                      ));
                },
              ),
            ],
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 60.0),
                child: controller.userPoints >= 5000 && tappedIndex == -1
                    ? ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(5),
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          backgroundColor:
                              const MaterialStatePropertyAll(AppColors.n20),
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Pilih Nominal',
                            style: Styles.whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: AppFontWeight.medium,
                            ),
                          ),
                        ),
                      )
                    : (controller.userPoints >= 5000 && tappedIndex != -1)
                        ? ElevatedButton(
                            onPressed: () {
                              if (tappedIndex != -1 &&
                                  controller.userPoints >= 5000) {
                                // If a nominal is selected and userPoints >= 5000
                                widget.tabController
                                    .animateTo(1); // Move to the next tab
                                widget.onNextTab();
                                controller.nominal = controller.selectedNominal;
                              }
                            },
                            style: ButtonStyle(
                              elevation: const MaterialStatePropertyAll(5),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              backgroundColor:
                                  const MaterialStatePropertyAll(AppColors.p40),
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Tarik Saldo',
                                style: Styles.whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: AppFontWeight.medium,
                                ),
                              ),
                            ),
                          )
                        : (controller.userPoints >= 5000 &&
                                tappedIndex != -1 &&
                                controller.selectedNominal <
                                    controller.userPoints.toDouble())
                            ? ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(5),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          AppColors.n20),
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Saldo Anda Belum Cukup',
                                    style: Styles.whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: AppFontWeight.medium,
                                    ),
                                  ),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(5),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          AppColors.n20),
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Saldo Anda Belum Cukup',
                                    style: Styles.whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: AppFontWeight.medium,
                                    ),
                                  ),
                                ),
                              ),
              )),
        ],
      ),
    );
  }
}
