import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class UkuranSampahCard extends StatefulWidget {
  static List ukuranSampah = [
    {'ukuran': 'Kecil', 'imagePath': 'assets/img/icon-ukuran-kecil.png'},
    {'ukuran': 'Sedang', 'imagePath': 'assets/img/icon-ukuran-sedang.png'},
    {'ukuran': 'Besar', 'imagePath': 'assets/img/icon-ukuran-besar.png'},
  ];

  const UkuranSampahCard({super.key});

  @override
  State<UkuranSampahCard> createState() => _UkuranSampahCardState();
}

class _UkuranSampahCardState extends State<UkuranSampahCard> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 20, childAspectRatio: 10 / 10),
        shrinkWrap: true,
        itemCount: UkuranSampahCard.ukuranSampah.length,
        itemBuilder: (context, index) {
          bool isTapped = index == tappedIndex;
          Color backgroundColor = !isTapped ? AppColors.a10 : AppColors.p40;
          Color foregroundColor = !isTapped ? AppColors.n50 : AppColors.white;
          return GestureDetector(
            onTap: () {
              setState(() {
                tappedIndex = index;
                if (tappedIndex != index) {
                  backgroundColor = AppColors.a10;
                  if (tappedIndex != -1) {
                    tappedIndex = -1;
                  }
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Image.asset(
                    UkuranSampahCard.ukuranSampah[index]['imagePath'],
                    height: 40,
                    color: foregroundColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    UkuranSampahCard.ukuranSampah[index]['ukuran'],
                    style: TextStyle(
                        color: foregroundColor,
                        fontWeight: AppFontWeight.semiBold,
                        fontSize: 12),
                  )),
                ],
              ),
            ),
          );
        });
  }
}
