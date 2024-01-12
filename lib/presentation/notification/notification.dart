import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/notification/components/notification_list.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  static List riwayatPoin = [
    {'amount': 250, 'date': '12/1/2024', 'masuk': false, 'ditukar': true},
    {'amount': 250, 'date': '12/1/2024', 'masuk': true, 'ditukar': false},
    {'amount': 700, 'date': '11/1/2024', 'masuk': true, 'ditukar': false},
    {'amount': 50, 'date': '12/1/2024', 'masuk': true, 'ditukar': false},
    {'amount': 250, 'date': '9/1/2024', 'masuk': false, 'ditukar': true},
  ];

  const NotificationPage({super.key});

  static String formatDate(DateTime date) {
    String formattedDate = '${date.day}/${date.month}/${date.year}';
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text('Notification',
            style: Styles.blackTextStyle
                .copyWith(fontSize: 18, fontWeight: AppFontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: (const Icon(Icons.search))),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hari Ini",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: AppFontWeight.medium,
                    color: const Color(0xFF757575)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: NotificationList(
                    notificationList: riwayatPoin
                        .where((element) =>
                            formatDate(DateTime.now()) == element['date'])
                        .toList()),
              ),
              Text(
                "Kemarin",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: AppFontWeight.medium,
                    color: const Color(0xFF757575)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: NotificationList(
                    notificationList: riwayatPoin
                        .where((element) =>
                            formatDate(
                                DateTime.now().subtract(Duration(days: 1))) ==
                            element['date'])
                        .toList()),
              ),
              Text(
                "Minggu Ini",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: AppFontWeight.medium,
                    color: const Color(0xFF757575)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
