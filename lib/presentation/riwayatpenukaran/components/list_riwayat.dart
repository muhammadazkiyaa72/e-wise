import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class ListRiwayat extends StatelessWidget {
  final int nominal;
  final String kategori;
  final String subtitle;
  final String time;
  final bool isTukar;
  const ListRiwayat({
    super.key,
    required this.nominal,
    required this.kategori,
    required this.subtitle,
    required this.time,
    required this.isTukar,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 327,
          height: 65,
          padding:
              const EdgeInsets.only(right: 9, left: 15, top: 11, bottom: 11),
          decoration: const BoxDecoration(
            color: Color(0xffFEFFFC),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Text(
                nominal.toString(),
                style: isTukar
                    ? Styles.redTextStyle.copyWith(
                        fontSize: 21,
                        fontWeight: AppFontWeight.medium,
                      )
                    : Styles.primaryTextStyle.copyWith(
                        fontSize: 21,
                        fontWeight: AppFontWeight.medium,
                      ),
              ),
              const SizedBox(
                width: 19,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kategori,
                    style: isTukar
                        ? Styles.redTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: AppFontWeight.medium,
                          )
                        : Styles.primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: AppFontWeight.medium,
                          ),
                  ),
                  Text(
                    subtitle,
                    style: isTukar
                        ? Styles.redTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: AppFontWeight.medium,
                          )
                        : Styles.primaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: AppFontWeight.medium,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 190,
          top: 7.60,
          child: SizedBox(
            width: 91,
            height: 10.10,
            child: Text(
              time.toString(),
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF73796C),
                fontSize: 10,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
