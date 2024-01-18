import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/find_location/detail_location_screen.dart';
import 'package:ewise/presentation/find_location/find_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListBank extends StatefulWidget {
  const ListBank({super.key});

  @override
  State<ListBank> createState() => _ListBankState();
}

class _ListBankState extends State<ListBank> {
  final FindLocationController controller = Get.put(FindLocationController());
  List<Map<String, dynamic>> ebankDataList = [];

  @override
  void initState() {
    super.initState();
    fetchEbankData();
  }

  void fetchEbankData() async {
    List<Map<String, dynamic>> ebankDataList =
        await controller.fetchEbankDataForNearestPoints();
    setState(() {
      this.ebankDataList = ebankDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 194,
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 20,
        top: 8,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 20,
                    color: Colors.black,
                  ),
                  Text(
                    'Jawa Barat',
                    style: Styles.blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: AppFontWeight.medium,
                      decoration: TextDecoration.none,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ebankDataList.map((ebankData) {
                    return GestureDetector(
                      onTap: () {
                        // Handle tap on ebank item
                        String imageURL = ebankData['imageURL'] ?? '';
                        String name = ebankData['name'] ?? '';
                        String alamat = ebankData['address'] ?? '';

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailLocationScreen(
                              imageURL: imageURL,
                              name: name,
                              alamat: alamat,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 160,
                        height: 123,
                        margin: const EdgeInsets.only(right: 8),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 160,
                                height: 123,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(ebankData[
                                        'imageURL']), // Assuming 'imageURL' is the field name for the image URL
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 75,
                              child: SizedBox(
                                width: 160,
                                height: 50,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Opacity(
                                        opacity: 0.70,
                                        child: Container(
                                          width: 160,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF151A20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 7,
                                      top: 3,
                                      child: SizedBox(
                                        width: 146,
                                        height: 50,
                                        child: Text(
                                          ebankData[
                                              'name'], // Assuming 'name' is the field name for the ebank name
                                          style: Styles.whiteTextStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: AppFontWeight.medium,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
