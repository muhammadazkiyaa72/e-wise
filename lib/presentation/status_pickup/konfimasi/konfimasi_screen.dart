import 'package:ewise/presentation/widgets/status_item.dart';
import 'package:flutter/material.dart';

class KonfirmasiScreen extends StatefulWidget {
  const KonfirmasiScreen({super.key});

  @override
  State<KonfirmasiScreen> createState() => _KonfirmasiScreenState();
}

class _KonfirmasiScreenState extends State<KonfirmasiScreen> {
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
              kode: 'O-231125-AGJLRCQ',
              ukuran: 'Sedang',
              jadwal: 'Senin, 8 Januari 2024',
              ebank: 'Bank Sampah Bersinar',
              assetImage: 'assets/icons/ic_konfirmasi.png',
            ),
            SizedBox(
              height: 21,
            ),
            StatusItem(
              kode: 'O-237725-QWERTY',
              ukuran: 'Sedang',
              jadwal: 'Senin, 8 Januari 2024',
              ebank: 'Bank Sampah Bersinar',
              assetImage: 'assets/icons/ic_konfirmasi.png',
            ),
            SizedBox(
              height: 21,
            ),
            StatusItem(
              kode: 'O-239425-ASDFGHJ',
              ukuran: 'Sedang',
              jadwal: 'Senin, 8 Januari 2024',
              ebank: 'Bank Sampah Bersinar',
              assetImage: 'assets/icons/ic_konfirmasi.png',
            ),
          ],
        ),
      ),
    );
  }
}
