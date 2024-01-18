import 'package:ewise/presentation/riwayatpenukaran/components/list_riwayat.dart';
import 'package:ewise/presentation/riwayatpenukaran/riwayat_penukaran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AllRiwayatScreen extends StatefulWidget {
  const AllRiwayatScreen({super.key});

  @override
  State<AllRiwayatScreen> createState() => _AllRiwayatScreenState();
}

class _AllRiwayatScreenState extends State<AllRiwayatScreen> {
  final RiwayatPenukaranController controller =
      Get.put(RiwayatPenukaranController());
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    controller.fetchRiwayatPoin();
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
                itemCount: controller.riwayatPoinList.length,
                itemBuilder: (context, index) {
                  final riwayat = controller.riwayatPoinList[index];
                  final formattedDate =
                      DateFormat('dd/MM/yyyy').format(riwayat.timestamp);
                  return Column(
                    children: [
                      ListRiwayat(
                        isTukar: riwayat.tukar,
                        kategori: riwayat.tukar == false
                            ? "Poin Masuk"
                            : "Poin Ditukarkan",
                        nominal: riwayat.tukar == false
                            ? riwayat.uang.toInt() 
                            : riwayat.uang.toInt(),
                        subtitle: riwayat.tukar == false
                            ? 'Berhasil mendapatkan poin'
                            : 'Penukaran poin dengan ${riwayat.ewallete}',
                        time: formattedDate.toString(),
                      ),
                      const SizedBox(
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
