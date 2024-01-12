import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  final List notificationList;

  const NotificationList({super.key, required this.notificationList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/img/icon-cs.png',
                    height: 48,
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.8, color: AppColors.a10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                text: 'Kamu telah melakukan penukaran ',
                                children: [
                              TextSpan(
                                  style: Styles.blackTextStyle
                                      .copyWith(fontSize: 12),
                                  text: '200'),
                              TextSpan(
                                  style: Styles.blackTextStyle
                                      .copyWith(fontSize: 12),
                                  text: ' Poin dengan Saldo Gopay Rp 5.000')
                            ])),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          '9.01 am',
                          style: Styles.blackTextStyle.copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
