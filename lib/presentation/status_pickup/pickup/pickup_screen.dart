import 'package:ewise/presentation/widgets/status_item.dart';
import 'package:flutter/material.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              height: 36,
            ),
            StatusItem(
              kode: 'O-240112-IDGITAF',
              ukuran: 'Kecil',
              jadwal: 'Jumat, 12 Januari 2024',
              ebank: 'Bank Sampah Bersinar',
              assetImage: 'assets/icons/ic_pickup.png',
            ),
          ],
        ),
      ),
    );
  }
}
