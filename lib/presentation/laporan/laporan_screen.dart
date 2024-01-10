import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class LaporanScreen extends StatelessWidget {
  const LaporanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporan',
          style: Styles.blackTextStyle.copyWith(
            fontWeight: AppFontWeight.semiBold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 46,
          ),
          Center(
            child: Image.asset(
              'assets/icons/ic_error.png',
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
