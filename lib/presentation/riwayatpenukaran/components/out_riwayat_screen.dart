import 'package:ewise/presentation/riwayatpenukaran/components/list_riwayat.dart';
import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OutRiwayatScreen extends StatefulWidget {
  const OutRiwayatScreen({super.key});

  @override
  State<OutRiwayatScreen> createState() => _OutRiwayatScreenState();
}

class _OutRiwayatScreenState extends State<OutRiwayatScreen> {
  final RiwayatPenukaranController controller =
      Get.put(RiwayatPenukaranController());
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    controller.fetchRiwayatPoinKeluar();
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
                itemCount: controller.riwayatPoinListKeluar.length,
                itemBuilder: (context, index) {
                  final riwayat = controller.riwayatPoinListKeluar[index];
                  final formattedDate =
                      DateFormat('dd/MM/yyyy').format(riwayat.timestamp);
                  return Column(
                    children: [
                      ListRiwayat(
                        isTukar: riwayat.tukar,
                        kategori: "Poin Ditukarkan",
                        nominal: riwayat.uang.toInt(),
                        subtitle: 'Penukaran poin dengan ${riwayat.ewallete}',
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
