import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/status_pickup/status_pickup_controller.dart';
import 'package:ewise/presentation/widgets/status_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  final StatusPickupController _statusPickupController =
      Get.put(StatusPickupController());

  @override
  void initState() {
    super.initState();
    _statusPickupController.fetchRiwayatPickup();
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
              for (var pickup
                  in _statusPickupController.riwayatPickupListPickup)
                StatusItem(
                  kode: pickup.userId,
                  ukuran: pickup.wasteSize,
                  jadwal: pickup.pickupDate,
                  ebank: pickup.ebankName,
                  assetImage: 'assets/icons/ic_konfirmasi.png',
                ),
              if (_statusPickupController.riwayatPickupListPickup.isEmpty)
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
