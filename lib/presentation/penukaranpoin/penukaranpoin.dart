import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin_controller.dart';
import 'package:ewise/presentation/penukaranpoin/views/e_wallet.dart';
import 'package:ewise/presentation/penukaranpoin/views/konfirmasi.dart';
import 'package:ewise/presentation/penukaranpoin/views/uang_tunai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenukaranPoin extends StatefulWidget {
  static List<String> tabBar = ['Uang Tunai', 'e-Wallet', 'Konfirmasi'];

  const PenukaranPoin({super.key});

  @override
  State<PenukaranPoin> createState() => _PenukaranPoinState();
}

class _PenukaranPoinState extends State<PenukaranPoin>
    with SingleTickerProviderStateMixin {
  final PenukaranPoinController controller = Get.put(PenukaranPoinController());
  int currentTabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: PenukaranPoin.tabBar.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: PenukaranPoin.tabBar.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.nominal.value = 0.0 ;
              controller.ewallet.value ='' ;
              controller.akun.value = '';
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text('Penukaran Poin',
              style: Styles.blackTextStyle
                  .copyWith(fontSize: 16, fontWeight: AppFontWeight.bold)),
          bottom: TabBar(
            indicatorColor: AppColors.p60,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.black,
            tabs: PenukaranPoin.tabBar.map((e) {
              return Tab(
                text: e,
              );
            }).toList(),
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            UangTunaiPage(tabController: _tabController, onNextTab: onNextTab),
            EWalletPage(tabController: _tabController, onNextTab: onNextTab),
            KonfirmasiPage(tabController: _tabController),
          ],
        ),
      ),
    );
  }

  void onNextTab() {
    if (currentTabIndex < PenukaranPoin.tabBar.length - 1) {
      setState(() {
        currentTabIndex++;
        _tabController.animateTo(currentTabIndex);
      });
    }
  }
}
