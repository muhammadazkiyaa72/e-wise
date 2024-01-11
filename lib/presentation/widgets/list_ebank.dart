import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/find_location/detail_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListBank extends StatelessWidget {
  const ListBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 194,
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 20,
        top: 8,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.20000000298023224),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                weight: 20,
                color: AppColors.black,
              ),
              Text(
                'Bojongsoang',
                style: Styles.blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: AppFontWeight.medium,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const DetailLocationScreen());
                  },
                  child: SizedBox(
                    width: 160,
                    height: 123,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 160,
                            height: 123,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/img/ebank1.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 75,
                          child: SizedBox(
                            width: 160,
                            height: 50,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Opacity(
                                    opacity: 0.70,
                                    child: Container(
                                      width: 160,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF151A20)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 7,
                                  top: 3,
                                  child: SizedBox(
                                    width: 146,
                                    height: 50,
                                    child: Text(
                                      'Bank Sampah Bersinar',
                                      style: Styles.whiteTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: AppFontWeight.medium,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 160,
                    height: 123,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 160,
                            height: 123,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/img/ebank2.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 75,
                          child: SizedBox(
                            width: 160,
                            height: 50,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Opacity(
                                    opacity: 0.70,
                                    child: Container(
                                      width: 160,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF151A20)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 7,
                                  top: 3,
                                  child: SizedBox(
                                    width: 146,
                                    height: 50,
                                    child: Text(
                                      'Komunitas e-Waste Bandung',
                                      style: Styles.whiteTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: AppFontWeight.medium,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 160,
                    height: 123,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 160,
                            height: 123,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/img/ebank3.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 75,
                          child: SizedBox(
                            width: 160,
                            height: 50,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Opacity(
                                    opacity: 0.70,
                                    child: Container(
                                      width: 160,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFF151A20)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 7,
                                  top: 3,
                                  child: SizedBox(
                                    width: 146,
                                    height: 50,
                                    child: Text(
                                      'Bank Sampah Elektronik',
                                      style: Styles.whiteTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: AppFontWeight.medium,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
