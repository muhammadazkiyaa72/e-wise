import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class LaporanScreen extends StatefulWidget {
  const LaporanScreen({super.key});

  @override
  State<LaporanScreen> createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textarea = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Image.asset(
                  'assets/icons/ic_error.png',
                  width: 80,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                controller: textarea,
                maxLines: 10,
                maxLength: 500,
                decoration: InputDecoration(
                  hintText: "Deskripsi Masalah",
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 310,
                  height: 32,
                  decoration: BoxDecoration(
                      color: AppColors.p40,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Kirim',
                      style: Styles.whiteTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
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
