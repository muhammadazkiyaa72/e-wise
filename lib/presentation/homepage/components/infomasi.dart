import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class Informasi extends StatefulWidget {
  static List cardMenu = [
    {
      'imagePath': 'assets/img/informasi_1.png',
      'headline': 'Setiap Hari, 75 Ton Sampah Elektronik Dibuang di Jakarta',
      'source': 'kompas.id',
      'date': '13 July 2023'
    },
    {
      'imagePath': 'assets/img/informasi_2.png',
      'headline':
          'Dampak Buruk yang Tersembunyi dari E-Waste: Kasus Kabut Elektronik di Cina',
      'source': 'yoursay.id',
      'date': '18 April 2023'
    },
    {
      'imagePath': 'assets/img/informasi_3.png',
      'headline':
          'Menilik Peran Komunitas E-waste Bandung dalam Mengelola Limbah Elektronik',
      'source': 'Bandung Bergerak',
      'date': '7 Desember 2023'
    },
  ];

  const Informasi({super.key});

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: Informasi.cardMenu.map((e) {
          return GestureDetector(
            onTap: () {
              print("this clicked");
            },
            child: Material(
              elevation: 5,
              child: Column(
                children: [
                  // picture
                  Image.asset(
                    e['imagePath'],
                    fit: BoxFit.fill,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        // title
                        Text(
                          e['headline'],
                          style: Styles.blackTextStyle.copyWith(
                              fontWeight: AppFontWeight.bold, fontSize: 10),
                        ),

                        // source and date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // source
                            Text(e['source'],
                                style: TextStyle(
                                    color: AppColors.grey2,
                                    fontSize: 10,
                                    fontWeight: AppFontWeight.regular)),

                            // date
                            Text(e['date'],
                                style: TextStyle(
                                    color: AppColors.grey2,
                                    fontSize: 10,
                                    fontWeight: AppFontWeight.regular)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
