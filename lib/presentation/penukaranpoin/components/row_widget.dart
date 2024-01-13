import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String label;
  final String value;

  const RowWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                label,
                style: Styles.blackTextStyle
                    .copyWith(fontSize: 12, fontWeight: AppFontWeight.semiBold),
              )),
          Expanded(
              flex: 2,
              child: Text(
                value,
                style: Styles.blackTextStyle
                    .copyWith(fontSize: 12, fontWeight: AppFontWeight.semiBold),
              ))
        ],
      ),
    );
  }
}
