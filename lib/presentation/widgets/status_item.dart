import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  final String assetImage;
  final String kode;
  final String ukuran;
  final String ebank;
  final String jadwal;
  const StatusItem({
    super.key,
    required this.kode,
    required this.ukuran,
    required this.jadwal,
    required this.ebank,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 119,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              assetImage,
              width: 65,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 194,
                child: Text(
                  kode,
                  style: Styles.blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: AppFontWeight.medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Ukuran :',
                    style: Styles.nTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  Text(
                    ukuran,
                    style: Styles.nTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'e-Bank :',
                    style: Styles.nTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  SizedBox(
                    width: 194,
                    child: Text(
                      ebank,
                      style: Styles.nTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: AppFontWeight.regular,
                      ),
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Jadwal :',
                    style: Styles.nTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  Text(
                    jadwal,
                    style: Styles.nTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 76,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1,
                          color: AppColors.p40,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.chat_bubble,
                              color: AppColors.p40,
                              size: 16,
                            ),
                            Text(
                              'Chat',
                              style: Styles.primaryTextStyle.copyWith(
                                fontSize: 11,
                                fontWeight: AppFontWeight.medium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 76,
                      height: 25,
                      decoration: BoxDecoration(
                        color: AppColors.p40,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1,
                          color: AppColors.p40,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Batalkan',
                          style: Styles.whiteTextStyle.copyWith(
                            fontSize: 11,
                            fontWeight: AppFontWeight.medium,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
