import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class DetailLocationScreen extends StatelessWidget {
  const DetailLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 154,
                  height: 141,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: const AssetImage('assets/img/ebank1.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Bank Sampah Bersinar',
                style: Styles.blackTextStyle.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFF0F0F0)),
                    borderRadius: BorderRadius.circular(8),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi',
                        style: Styles.blackTextStyle.copyWith(
                          fontWeight: AppFontWeight.regular,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Bank Sampah Bersinar merupakan bank sampah umum yang berada di wilayah bojongsoang',
                        textAlign: TextAlign.justify,
                        style: Styles.blackTextStyle.copyWith(
                          fontWeight: AppFontWeight.regular,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                // height: 92,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFF0F0F0)),
                    borderRadius: BorderRadius.circular(8),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jam Operasional',
                        style: Styles.blackTextStyle.copyWith(
                          fontWeight: AppFontWeight.regular,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_rounded,
                                    color: AppColors.black,
                                    weight: 15,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Senin-Jumat',
                                    style: Styles.blackTextStyle.copyWith(
                                      fontWeight: AppFontWeight.regular,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_rounded,
                                    color: AppColors.black,
                                    weight: 15,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Sabtu',
                                    style: Styles.blackTextStyle.copyWith(
                                      fontWeight: AppFontWeight.regular,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_rounded,
                                    color: Color(0xFFDE0000),
                                    weight: 15,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Minggu',
                                    style: Styles.blackTextStyle.copyWith(
                                      color: const Color(0xFFDE0000),
                                      fontWeight: AppFontWeight.regular,
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '08:00 - 15:00',
                                style: Styles.blackTextStyle.copyWith(
                                  fontWeight: AppFontWeight.regular,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '08:00 - 14:00',
                                style: Styles.blackTextStyle.copyWith(
                                  fontWeight: AppFontWeight.regular,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Tutup',
                                style: Styles.blackTextStyle.copyWith(
                                  fontWeight: AppFontWeight.regular,
                                  fontSize: 11,
                                  color: const Color(0xFFDE0000),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 86,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFF0F0F0)),
                    borderRadius: BorderRadius.circular(8),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kontak',
                        style: Styles.blackTextStyle.copyWith(
                          fontWeight: AppFontWeight.regular,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.call_outlined,
                            weight: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '(022)5946942',
                            textAlign: TextAlign.justify,
                            style: Styles.blackTextStyle.copyWith(
                              fontWeight: AppFontWeight.regular,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFF0F0F0)),
                    borderRadius: BorderRadius.circular(8),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat',
                        style: Styles.blackTextStyle.copyWith(
                          fontWeight: AppFontWeight.regular,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Jl. Terusan Bojongsoang No.174, Baleendah, Kec.Baleendah, Kabupaten Bandung, Jawa Barat 40375',
                        textAlign: TextAlign.justify,
                        style: Styles.blackTextStyle.copyWith(
                          fontWeight: AppFontWeight.regular,
                          fontSize: 11,
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
    );
  }
}
