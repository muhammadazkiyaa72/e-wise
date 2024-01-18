import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/penukaranpoin/penukaranpoin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserList extends StatelessWidget {
  final VoidCallback onNextTab;
  final List userEWallets;
  const UserList(
      {super.key, required this.userEWallets, required this.onNextTab});

  @override
  Widget build(BuildContext context) {
    final PenukaranPoinController controller =
        Get.put(PenukaranPoinController());
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (userEWallets[index]['isAvailable']) {
                controller.updateSelectedWallet(
                  userEWallets[index]['eWallet'],
                  userEWallets[index]['number'],
                );
                onNextTab();
              }
            },
            child: Container(
              color: const Color(0xFFFEF7FF),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 40,
                          child: Image.asset((userEWallets[index]['icon']))),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userEWallets[index]['eWallet'],
                            style: Styles.blackTextStyle.copyWith(
                                fontWeight: AppFontWeight.regular,
                                fontSize: 13),
                          ),
                          if (userEWallets[index]['isAvailable'])
                            HiddenText(
                                text: userEWallets[index]['number'],
                                startIndex: 4,
                                endIndex: 10)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        userEWallets[index]['isAvailable']
                            ? 'Hapus Akun'
                            : 'Hubungkan',
                        style: Styles.blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: AppFontWeight.regular),
                      ),
                      const Icon(
                        Icons.navigate_next,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: ((context, index) => const SizedBox(
              height: 10,
            )),
        itemCount: userEWallets.length);
  }
}

class HiddenText extends StatelessWidget {
  final String text;
  final int startIndex;
  final int endIndex;

  HiddenText({
    required this.text,
    required this.startIndex,
    required this.endIndex,
  });

  @override
  Widget build(BuildContext context) {
    String visibleText = text.substring(0, startIndex);
    String hiddenText =
        text.substring(startIndex, endIndex).replaceAll(RegExp(r'.'), '*');
    String remainingText = text.substring(endIndex);

    return Text(
      '$visibleText$hiddenText$remainingText',
      style: Styles.blackTextStyle.copyWith(
        fontWeight: AppFontWeight.regular,
        fontSize: 11,
      ),
    );
  }
}
