import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/status_pickup/status_pickup_controller.dart';
import 'package:ewise/presentation/widgets/status_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KonfirmasiScreen extends StatefulWidget {
  const KonfirmasiScreen({super.key});

  @override
  State<KonfirmasiScreen> createState() => _KonfirmasiScreenState();
}

class _KonfirmasiScreenState extends State<KonfirmasiScreen> {
  final StatusPickupController _statusPickupController =
      Get.put(StatusPickupController());

  @override
  void initState() {
    super.initState();
    _statusPickupController.fetchRiwayatPickupKonfirmasi();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              if (_statusPickupController
                  .riwayatPickupListKonfirmasi.isNotEmpty)
                for (var pickup
                    in _statusPickupController.riwayatPickupListKonfirmasi)
                  Column(
                    children: [
                      StatusItem(
                        kode: pickup.pickupId!,
                        ukuran: pickup.wasteSize,
                        jadwal: pickup.pickupDate,
                        ebank: pickup.ebankName,
                        assetImage: 'assets/icons/ic_konfirmasi.png',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
              if (_statusPickupController.riwayatPickupListKonfirmasi.isEmpty)
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img/no_found.png',
                        width: 250,
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      Text(
                        'Belum ada pesanan pada status ini',
                        style: Styles.blackTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: AppFontWeight.medium,
                        ),
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
