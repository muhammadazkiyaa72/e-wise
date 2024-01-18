import 'package:ewise/presentation/riwayatpenukaran/components/list_riwayat.dart';
import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InRiwayatScreen extends StatefulWidget {
  const InRiwayatScreen({super.key});

  @override
  State<InRiwayatScreen> createState() => _InRiwayatScreenState();
}

class _InRiwayatScreenState extends State<InRiwayatScreen> {
  final RiwayatPenukaranController controller =
      Get.put(RiwayatPenukaranController());
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    controller.fetchRiwayatPoinMasuk();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.riwayatPoinListMasuk.length,
                itemBuilder: (context, index) {
                  final riwayat = controller.riwayatPoinListMasuk[index];
                  final formattedDate =
                      DateFormat('dd/MM/yyyy').format(riwayat.timestamp);
                  return Column(
                    children: [
                      ListRiwayat(
                        isTukar: riwayat.tukar,
                        kategori: "Poin Masuk",
                        nominal: riwayat.uang.toInt(),
                        subtitle: 'Berhasil mendapatkan poin',
                        time: formattedDate.toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
