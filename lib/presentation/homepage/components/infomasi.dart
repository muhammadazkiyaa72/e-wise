import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Informasi extends StatelessWidget {
  final Uri url2;
  final String judul;
  final String tanggal;
  final String assetImage;
  final String sumber;

  const Informasi({
    super.key,
    required this.url2,
    required this.judul,
    required this.tanggal,
    required this.assetImage,
    required this.sumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(url2);
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
            width: MediaQuery.of(context).size.width,
            height: 257,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
