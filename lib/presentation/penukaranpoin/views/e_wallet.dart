// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ewise/presentation/penukaranpoin/penukaranpoin_controller.dart';
import 'package:flutter/material.dart';

import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/penukaranpoin/components/user_list.dart';
import 'package:get/get.dart';

class EWalletPage extends StatefulWidget {
  final VoidCallback onNextTab;
  final TabController tabController;
  static List listEWallet = [
    {'name': 'Gopay', 'icon': 'assets/img/icon-gopay.png'},
    {'name': 'OVO', 'icon': 'assets/img/icon-ovo.png'},
    {'name': 'DANA', 'icon': 'assets/img/icon-dana.png'},
    {'name': 'Shopeepay', 'icon': 'assets/img/icon-shopeepay.png'}
  ];

  static List userEWallets = listEWallet
      .map((e) => {
            'icon': e['icon'],
            'eWallet': e['name'],
            'isAvailable': e['name'] != 'Shopeepay' ? true : false,
            'number': '+6281234567891'
          })
      .toList();

  const EWalletPage({
    Key? key,
    required this.tabController,
    required this.onNextTab,
  }) : super(key: key);

  @override
  State<EWalletPage> createState() => _EWalletPageState();
}

class _EWalletPageState extends State<EWalletPage> {
  final PenukaranPoinController controller = Get.put(PenukaranPoinController());
  @override
  Widget build(BuildContext context) {
    if (controller.nominal.value == 0.0) {
      return const Center(
        child: Text('Pilih Nominal Terlebih dahulu!'),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // akun tersedia
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Akun Tersedia',
              style: Styles.blackTextStyle
                  .copyWith(fontSize: 13, fontWeight: AppFontWeight.semiBold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: UserList(
                  userEWallets: EWalletPage.userEWallets
                      .where((element) => element['isAvailable'])
                      .toList(),
                  onNextTab: widget.onNextTab)),

          // Akun Tidak Tersedia
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Tambah Akun Baru',
              style: Styles.blackTextStyle
                  .copyWith(fontSize: 13, fontWeight: AppFontWeight.semiBold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: UserList(
                userEWallets: EWalletPage.userEWallets
                    .where((element) => !element['isAvailable'])
                    .toList(),
                onNextTab: widget.onNextTab),
          ),
        ],
      );
    }
  }
}
