import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/penukaranpoin/components/user_list.dart';
import 'package:flutter/material.dart';

class EWalletPage extends StatelessWidget {
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

  const EWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16.0),
      child: Column(
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
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: UserList(
            userEWallets: userEWallets
                .where((element) => element['isAvailable'])
                .toList(),
          )),

          // Akun Tidak Tersedia
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Tambah Akun Baru',
              style: Styles.blackTextStyle
                  .copyWith(fontSize: 13, fontWeight: AppFontWeight.semiBold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: UserList(
            userEWallets: userEWallets
                .where((element) => !element['isAvailable'])
                .toList(),
          )),
        ],
      ),
    );
  }
}
