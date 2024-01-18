import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/homepage/homepage_screen.dart';
import 'package:ewise/presentation/pickup/components/ukuran_sampah.dart';
import 'package:ewise/presentation/pickup/pickup_controller.dart';

class StatusBar extends StatefulWidget {
  final PickupController pickupController;
  const StatusBar({Key? key, required this.pickupController}) : super(key: key);

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  final TextEditingController _dateController = TextEditingController();
  late Future<void> locationDetailsFuture;
  int active = 0;

  bool pickup = false;

  @override
  void initState() {
    active;
    super.initState();
    locationDetailsFuture = widget.pickupController.getUserLocationDetails();
    initPage();
  }

  Future<void> initPage() async {
    try {
      await widget.pickupController.initPage();
      widget.pickupController.update();
    } catch (e) {
      print("Error initializing map: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print('$locationDetailsFuture');
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

    Future.delayed(const Duration(seconds: 6), () async {
      if (active == 1) {
        active += 1;
        setState(() {
          active;
        });
      }
    });

    Future.delayed(const Duration(seconds: 10), () async {
      if (active == 2) {
        pickup = true;
        setState(() {
          pickup;
        });
      }
    });

    Future.delayed(const Duration(seconds: 15), () async {
      if (active == 3) {
        Future.delayed(const Duration(seconds: 15), () async {
          Get.offAll(const HomePageScreen());
        });
      }
    });
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 19,
                ),
                Text('Status - Pemesanan',
                    style: Styles.blackTextStyle.copyWith(
                        fontSize: 15, fontWeight: AppFontWeight.semiBold)),
                const SizedBox(
                  height: 13,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 25,
                          left: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: active == 0
                                          ? AppColors.p40
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: active == 0
                                          ? Image.asset(
                                              'assets/icons/ic_pesanan_white.png',
                                              width: 25,
                                            )
                                          : Image.asset(
                                              'assets/icons/ic_pesanan_grey.png',
                                              width: 25,
                                            ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Pesanan',
                                    style: active == 0
                                        ? Styles.primaryTextStyle
                                        : Styles.nTextStyle
                                            .copyWith(color: Colors.grey[400]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: active == 1
                                          ? AppColors.p40
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: active == 1
                                          ? Image.asset(
                                              'assets/icons/ic_konfirmasi_white.png',
                                              width: 25,
                                            )
                                          : Image.asset(
                                              'assets/icons/ic_konfirmasi_grey.png',
                                              width: 25,
                                            ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Konfirmasi',
                                    style: active == 1
                                        ? Styles.primaryTextStyle
                                        : Styles.nTextStyle
                                            .copyWith(color: Colors.grey[400]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: active == 2
                                          ? AppColors.p40
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: active == 2
                                          ? Image.asset(
                                              'assets/icons/ic_pickup_white.png',
                                              width: 25,
                                            )
                                          : Image.asset(
                                              'assets/icons/ic_pickup_grey.png',
                                              width: 25,
                                            ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Pickup',
                                    style: active == 2
                                        ? Styles.primaryTextStyle
                                        : Styles.nTextStyle
                                            .copyWith(color: Colors.grey[400]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: active == 3
                                          ? AppColors.p40
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: active == 3
                                          ? Image.asset(
                                              'assets/icons/ic_selesai_white.png',
                                              width: 25,
                                            )
                                          : Image.asset(
                                              'assets/icons/ic_selesai_grey.png',
                                              width: 25,
                                            ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Selesai',
                                    style: active == 3
                                        ? Styles.primaryTextStyle
                                        : Styles.nTextStyle
                                            .copyWith(color: Colors.grey[400]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                if (active == 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ukuran Sampah',
                        style: Styles.blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: AppFontWeight.semiBold),
                      ),
                      const UkuranSampahCard(),
                      const SizedBox(
                        height: 38,
                      ),
                      /* FutureBuilder(
                        future: locationDetailsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              return Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      readOnly: true,
                                      controller: widget.pickupController
                                          .pickupLocationController,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.only(top: 5),
                                          filled: true,
                                          fillColor: AppColors.a10,
                                          labelText: 'Lokasi Penjemputan',
                                          labelStyle: Styles.blackTextStyle
                                              .copyWith(fontSize: 12),
                                          hintText: 'Pilih lokasi penjemputan',
                                          hintStyle: Styles.blackTextStyle
                                              .copyWith(fontSize: 12),
                                          prefixIcon: const Icon(
                                              Icons.location_on_outlined)),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      controller: widget
                                          .pickupController.ebankController,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.only(top: 5),
                                          filled: true,
                                          fillColor: AppColors.a10,
                                          labelText: 'e-Waste Bank',
                                          hintText: 'Pilih e-Waste Bank',
                                          labelStyle: Styles.blackTextStyle
                                              .copyWith(fontSize: 12),
                                          hintStyle: Styles.blackTextStyle
                                              .copyWith(fontSize: 12),
                                          prefixIcon: const Icon(
                                              Icons.location_on_outlined)),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      controller: _dateController,
                                      onTap: selectDate,
                                      // /readOnly: true,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.only(top: 5),
                                          filled: true,
                                          fillColor: AppColors.a10,
                                          labelText: 'Jadwal',
                                          hintText: 'DD/MM/YY',
                                          labelStyle: Styles.blackTextStyle
                                              .copyWith(fontSize: 12),
                                          hintStyle: Styles.blackTextStyle
                                              .copyWith(fontSize: 12),
                                          prefixIcon:
                                              const Icon(Icons.today_outlined)),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      maxLength: 100,
                                      controller: widget
                                          .pickupController.notesController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 2),
                                        filled: true,
                                        fillColor: AppColors.a10,
                                        labelText: 'Catatan',
                                        hintText: 'Berikan Catatan',
                                        labelStyle: Styles.blackTextStyle
                                            .copyWith(fontSize: 12),
                                        hintStyle: Styles.blackTextStyle
                                            .copyWith(fontSize: 12),
                                        helperText: 'Max 100 kata',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ), */

                      Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              readOnly: true,
                              controller: widget
                                  .pickupController.pickupLocationController,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(top: 5),
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
                              controller:
                                  widget.pickupController.ebankController,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(top: 5),
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
                              // /readOnly: true,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(top: 5),
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
                              controller:
                                  widget.pickupController.notesController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                filled: true,
                                fillColor: AppColors.a10,
                                labelText: 'Catatan',
                                hintText: 'Berikan Catatan',
                                labelStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                hintStyle: Styles.blackTextStyle
                                    .copyWith(fontSize: 12),
                                helperText: 'Max 100 kata',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (active < 3) {
                              active += 1;
                              setState(() {
                                active;
                              });
                            }

                            widget.pickupController.scheduleController =
                                _dateController;
                            widget.pickupController.submitPickupForm();
                          },
                          child: Container(
                            width: 310,
                            height: 32,
                            decoration: BoxDecoration(
                                color: AppColors.p40,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Atur Penjemputan',
                                style: Styles.whiteTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: AppFontWeight.semiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                if (active == 1)
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Pesanan Sedang menunggu di konfirmasi oleh e-wise',
                      style: Styles.primaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (active == 2)
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Text(
                          'Pesanan anda akan segera dipickup!',
                          style: Styles.primaryTextStyle.copyWith(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      if (pickup == true)
                        GestureDetector(
                          onTap: () {
                            if (active < 3) {
                              active += 1;
                              setState(() {
                                active;
                              });
                              widget.pickupController
                                  .updateLastPickupStatus('Selesai')
                                  .whenComplete(() {
                                Get.snackbar('Success',
                                    'Pesenan Telah Selesai dilakukan!');
                              });
                            }

                            // Update the last pickup status on Firebase
                          },
                          child: Container(
                            width: 310,
                            height: 32,
                            decoration: BoxDecoration(
                                color: AppColors.p40,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Selesaikan Pickup',
                                style: Styles.whiteTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: AppFontWeight.semiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (active == 3)
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Text(
                            'Pesanan Telah Selesai Dilakukan',
                            style: Styles.primaryTextStyle.copyWith(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
