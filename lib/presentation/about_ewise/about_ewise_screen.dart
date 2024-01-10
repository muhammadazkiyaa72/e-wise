import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutEWise extends StatelessWidget {
  const AboutEWise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang e-Wise',
          style: Styles.blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          margin: const EdgeInsets.only(top: 83),
          width: double.infinity,
          height: 338,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(-5, 0),
              ),
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(5, 0),
              )
            ],
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: SizedBox(
            height: 270,
            width: 287,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'e-Wise',
                      style: Styles.primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' merupakan aplikasi yang dikembangkan oleh ',
                      style: Styles.blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    TextSpan(
                      text: 'Tim',
                      style: Styles.blackTextStyle.copyWith(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    TextSpan(
                      text: 'Situ',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFB3261E),
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' yang bertujuan agar masyarakat dapat menyalurkan sampah elektroniknya menuju ke pihak pengelola sampah elektronik disekitar baik secara langsung maupun tidak langsung melalui seorang kurir yang akan mengantarkan sampah ke pihak pengelola sampah elektronik. Setiap sampah yang disalurkan akan memberikan manfaat bagi pengguna dalam bentuk poin yang dapat tukarkan e-money atau voucher. Harapannya masyarakat bisa lebih termotivasi dan sadar akan pentingnya pengelolaan sampah elektronik yang baik.',
                      style: Styles.blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
