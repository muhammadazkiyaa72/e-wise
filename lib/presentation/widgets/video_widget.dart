import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoWidgets extends StatelessWidget {
  const VideoWidgets({
    super.key,
    required this.url,
    required this.judul,
    required this.tanggal,
    required this.assetImage,
    required this.sumber,
    required this.durasi,
  });

  final Uri url;
  final String judul;
  final String tanggal;
  final String assetImage;
  final String sumber;
  final String durasi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(url);
      },
      child: Center(
        child: Card(
          surfaceTintColor: AppColors.white,
          color: AppColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            width: 327,
            height: 257,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 157,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                              bottom: Radius.circular(8),
                            ),
                            image: DecorationImage(
                              image: AssetImage(assetImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/ic_play.png',
                          width: 50,
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            durasi, // Replace with the actual duration
                            style: GoogleFonts.poppins(
                              color: const Color(0xffB2BBC6),
                              fontSize: 12,
                              fontWeight: AppFontWeight.regular,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            judul,
                            style: Styles.blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: AppFontWeight.medium,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sumber,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff546881),
                                  fontSize: 12,
                                  fontWeight: AppFontWeight.regular,
                                ),
                              ),
                              Text(
                                tanggal,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff546881),
                                  fontSize: 10,
                                  fontWeight: AppFontWeight.regular,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
