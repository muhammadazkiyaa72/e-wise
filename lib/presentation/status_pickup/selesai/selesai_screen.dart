import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class SelesaiScreen extends StatefulWidget {
  const SelesaiScreen({super.key});

  @override
  State<SelesaiScreen> createState() => _SelesaiScreenState();
}

class _SelesaiScreenState extends State<SelesaiScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            const Image(
              image: AssetImage('assets/img/no_found.png'),
              height: 250,
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Belum ada pesanan pada status ini',
              textAlign: TextAlign.center,
              style: Styles.blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: AppFontWeight.medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
