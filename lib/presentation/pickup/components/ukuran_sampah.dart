import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/pickup/pickup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UkuranSampahCard extends StatefulWidget {
  static List<Map<String, String>> ukuranSampah = [
    {'ukuran': 'Kecil', 'imagePath': 'assets/img/icon-ukuran-kecil.png'},
    {'ukuran': 'Sedang', 'imagePath': 'assets/img/icon-ukuran-sedang.png'},
    {'ukuran': 'Besar', 'imagePath': 'assets/img/icon-ukuran-besar.png'},
  ];

  const UkuranSampahCard({Key? key}) : super(key: key);

  @override
  State<UkuranSampahCard> createState() => _UkuranSampahCardState();
}

class _UkuranSampahCardState extends State<UkuranSampahCard> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        childAspectRatio: 10 / 10,
      ),
      shrinkWrap: true,
      itemCount: UkuranSampahCard.ukuranSampah.length,
      itemBuilder: (context, index) {
        return buildUkuranSampahCard(index);
      },
    );
  }

  Widget buildUkuranSampahCard(int index) {
    bool isTapped = index == tappedIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          tappedIndex = isTapped ? -1 : index;
        });
        // Notify the controller about the selected waste size
        PickupController pickupController = Get.find();
        pickupController.selectedWasteSize =
            isTapped ? null : UkuranSampahCard.ukuranSampah[index]['ukuran'];
      },
      child: Container(
        decoration: BoxDecoration(
          color: isTapped ? AppColors.p40 : AppColors.a10,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Image.asset(
              UkuranSampahCard.ukuranSampah[index]['imagePath']!,
              height: 40,
              color: isTapped ? AppColors.white : AppColors.n50,
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                UkuranSampahCard.ukuranSampah[index]['ukuran']!,
                style: TextStyle(
                  color: isTapped ? AppColors.white : AppColors.n50,
                  fontWeight: AppFontWeight.semiBold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
