import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class RiwayatPenukaran extends StatefulWidget {
  static List riwayatPoin = [
    {'amount': 250, 'date': '12/12/2023', 'masuk': false, 'ditukar': true},
    {'amount': 250, 'date': '12/12/2023', 'masuk': false, 'ditukar': true},
    {'amount': 700, 'date': '12/12/2023', 'masuk': true, 'ditukar': false},
    {'amount': 700, 'date': '12/12/2023', 'masuk': true, 'ditukar': false},
    {'amount': 700, 'date': '12/12/2023', 'masuk': true, 'ditukar': false},
    {'amount': 50, 'date': '12/12/2023', 'masuk': true, 'ditukar': false},
    {'amount': 250, 'date': '12/12/2023', 'masuk': false, 'ditukar': true},
  ];

  const RiwayatPenukaran({super.key});
  @override
  State<RiwayatPenukaran> createState() => _RiwayatPenukaranState();
}

class _RiwayatPenukaranState extends State<RiwayatPenukaran> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Riwayat',
            style: Styles.blackTextStyle
                .copyWith(fontSize: 16, fontWeight: AppFontWeight.bold)),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RiwayatButton(
                          name: 'Semua',
                          isTapped: tappedIndex == 0,
                          onPressed: () => setState(() {
                                tappedIndex = 0;
                              })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RiwayatButton(
                          name: 'Poin Masuk',
                          isTapped: tappedIndex == 1,
                          onPressed: () => setState(() {
                                tappedIndex = 1;
                              })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RiwayatButton(
                          name: 'Ditukarkan',
                          isTapped: tappedIndex == 2,
                          onPressed: () => setState(() {
                                tappedIndex = 2;
                              })),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: IndexedStack(
                index: tappedIndex,
                children: [
                  RiwayatPoinList(riwayatPoin: RiwayatPenukaran.riwayatPoin),
                  RiwayatPoinList(
                      riwayatPoin: RiwayatPenukaran.riwayatPoin
                          .where((element) => element['masuk'])
                          .toList()),
                  RiwayatPoinList(
                      riwayatPoin: RiwayatPenukaran.riwayatPoin
                          .where((element) => element['ditukar'])
                          .toList()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RiwayatButton extends StatefulWidget {
  final String name;
  final bool isTapped;
  final VoidCallback onPressed;

  const RiwayatButton(
      {super.key,
      required this.name,
      required this.isTapped,
      required this.onPressed});

  @override
  State<RiwayatButton> createState() => _RiwayatButtonState();
}

class _RiwayatButtonState extends State<RiwayatButton> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.isTapped ? AppColors.p40 : AppColors.white;
    Color foregroundColor = widget.isTapped ? AppColors.white : AppColors.black;
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ]),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
                color: foregroundColor, fontWeight: AppFontWeight.medium),
          ),
        ),
      ),
    );
  }
}

class RiwayatPoinList extends StatefulWidget {
  final List riwayatPoin;
  const RiwayatPoinList({super.key, required this.riwayatPoin});

  @override
  State<RiwayatPoinList> createState() => _RiwayatPoinListState();
}

class _RiwayatPoinListState extends State<RiwayatPoinList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.riwayatPoin.length,
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ]),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      '${widget.riwayatPoin[index]['amount']}',
                      style: Styles.primaryTextStyle.copyWith(
                          fontSize: 20, fontWeight: AppFontWeight.semiBold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.riwayatPoin[index]['masuk']
                                  ? 'Poin Masuk'
                                  : 'Poin Ditukar',
                              style: Styles.primaryTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: AppFontWeight.semiBold),
                            ),
                            Text(
                              widget.riwayatPoin[index]['date'],
                              style: Styles.primaryTextStyle.copyWith(
                                  fontSize: 8,
                                  fontWeight: AppFontWeight.regular),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.riwayatPoin[index]['masuk']
                            ? 'Berhasil mendapatkan poin'
                            : 'Penukaran poin dengan DANA',
                        style: Styles.blackTextStyle.copyWith(
                            fontSize: 11, fontWeight: AppFontWeight.medium),
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
    );
  }
}
