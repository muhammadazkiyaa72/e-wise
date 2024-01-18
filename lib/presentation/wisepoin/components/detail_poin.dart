import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class DetailPoin extends StatefulWidget {
  final bool poinMasuk;
  final double pointValue; // Pass the point value from the controller

  const DetailPoin(
      {Key? key, required this.poinMasuk, required this.pointValue})
      : super(key: key);

  @override
  State<DetailPoin> createState() => _DetailPoinState();
}

class _DetailPoinState extends State<DetailPoin> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          border: widget.poinMasuk
              ? const Border(
                  bottom: BorderSide(color: AppColors.black, width: 0.4),
                  right: BorderSide(color: AppColors.black, width: 0.4))
              : const Border(
                  bottom: BorderSide(color: AppColors.black, width: 0.4),
                  left: BorderSide(color: AppColors.black, width: 0.4)),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  widget.poinMasuk ? Icons.south : Icons.north,
                  color: AppColors.e40,
                ),
                Text(
                  widget.poinMasuk ? "Poin Masuk" : "Poin Ditukar",
                  style: Styles.blackTextStyle
                      .copyWith(fontSize: 14, fontWeight: AppFontWeight.medium),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${widget.pointValue.toInt()}",
              style: TextStyle(
                  color: AppColors.e40,
                  fontSize: 30,
                  fontWeight: AppFontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
