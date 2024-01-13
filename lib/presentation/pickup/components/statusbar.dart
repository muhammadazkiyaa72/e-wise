import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/pickup/components/ukuran_sampah.dart';
import 'package:flutter/material.dart';

class StatusBar extends StatefulWidget {
  const StatusBar({super.key});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  int tappedIndex = 0;

  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> selectDate() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (picked != null) {
        setState(() {
          _dateController.text = picked.toString().split(" ")[0];
        });
      }
    }

    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.25,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: AppColors.n50, width: 3))),
                      width: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // status pemesanan
                      Text('Status - Pemesanan',
                          style: Styles.blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: AppFontWeight.semiBold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatusButton(
                              label: 'Pesanan',
                              icon: Icons.history,
                              isTapped: tappedIndex == 1,
                              onPressed: () => setState(() {
                                    tappedIndex = 1;
                                  })),
                          StatusButton(
                              label: 'Konfirmasi',
                              icon: Icons.history,
                              isTapped: tappedIndex == 2,
                              onPressed: () => setState(() {
                                    tappedIndex = 2;
                                  })),
                          StatusButton(
                              label: 'Pickup',
                              icon: Icons.history,
                              isTapped: tappedIndex == 3,
                              onPressed: () => setState(() {
                                    tappedIndex = 3;
                                  })),
                          StatusButton(
                              label: 'Selesai',
                              icon: Icons.check_circle_outline_outlined,
                              isTapped: tappedIndex == 4,
                              onPressed: () => setState(() {
                                    tappedIndex = 4;
                                  })),
                        ],
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      // ukuran sampah
                      Text(
                        'Ukuran Sampah',
                        style: Styles.blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: AppFontWeight.semiBold),
                      ),
                      const UkuranSampahCard(),

                      const SizedBox(
                        height: 50,
                      ),

                      // form field
                      Form(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.only(top: 5),
                                filled: true,
                                fillColor: AppColors.a10,
                                labelText: 'Lokasi Penjemputan',
                                labelStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                hintText: 'Pilih lokasi penjemputan',
                                hintStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                prefixIcon:
                                    const Icon(Icons.location_on_outlined)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.only(top: 5),
                                filled: true,
                                fillColor: AppColors.a10,
                                labelText: 'e-Waste Bank',
                                hintText: 'Pilih e-Waste Bank',
                                labelStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                hintStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                prefixIcon:
                                    const Icon(Icons.location_on_outlined)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _dateController,
                            onTap: selectDate,
                            readOnly: true,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.only(top: 5),
                                filled: true,
                                fillColor: AppColors.a10,
                                labelText: 'Jadwal',
                                hintText: 'DD/MM/YY',
                                labelStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                hintStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                prefixIcon: const Icon(Icons.today_outlined)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            maxLength: 100,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 2),
                              filled: true,
                              fillColor: AppColors.a10,
                              labelText: 'Catatan',
                              hintText: 'Berikan Catatan',
                              labelStyle:
                                  Styles.blackTextStyle.copyWith(fontSize: 12),
                              hintStyle:
                                  Styles.blackTextStyle.copyWith(fontSize: 12),
                              helperText: 'Max 100 kata',
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print('Konfirmasi');
                      },
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              const MaterialStatePropertyAll(AppColors.p40),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 8))),
                      child: Center(
                        child: Text(
                          'Atur Penjemputan',
                          style: Styles.whiteTextStyle.copyWith(
                              fontSize: 10, fontWeight: AppFontWeight.semiBold),
                        ),
                      )),
                ],
              ),
            ),
          );
        });
  }
}

class StatusButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isTapped;
  final VoidCallback onPressed;

  const StatusButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.isTapped,
      required this.onPressed});

  @override
  State<StatusButton> createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.isTapped ? AppColors.p40 : AppColors.a10;
    Color foregroundColor = widget.isTapped ? AppColors.white : AppColors.p50;
    return InkWell(
        onTap: widget.onPressed,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: Icon(
                widget.icon,
                color: foregroundColor,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(widget.label,
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: AppFontWeight.medium,
                      color: backgroundColor)),
            )
          ],
        ));
  }
}
