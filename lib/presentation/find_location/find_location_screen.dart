import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/find_location/detail_location_screen.dart';
import 'package:ewise/presentation/find_location/find_location_controller.dart';
import 'package:ewise/presentation/homepage/homepage_screen.dart';
import 'package:ewise/presentation/widgets/list_ebank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:get/get.dart';

class FindLocationScreen extends StatefulWidget {
  const FindLocationScreen({Key? key}) : super(key: key);

  @override
  State<FindLocationScreen> createState() => _FindLocationScreenState();
}

class _FindLocationScreenState extends State<FindLocationScreen> {
  final FindLocationController controller = Get.put(FindLocationController());

  @override
  void initState() {
    super.initState();
    initPage();
  }

  Future<void> initPage() async {
    controller.getCurrentLocation();
    await controller.getUserLocationDetails();
    await controller.fetchEbankDataForNearestPoints();
  }

  bool showBankList = false;
  bool showSearchBar = false;
  TextEditingController searchController = TextEditingController();

  List<String> filteredList = [];
  List<Map<String, dynamic>> ebankDataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BuildMap(controller: controller),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (showSearchBar == false)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Get.offAll(const HomePageScreen());
                            showSearchBar = false;
                          });
                        },
                        child: Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            size: 24,
                          ),
                        ),
                      ),
                    if (showSearchBar == false)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showSearchBar = true;
                          });
                        },
                        child: Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.search,
                            size: 24,
                          ),
                        ),
                      ),
                  ],
                ),
                if (showSearchBar)
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 16, bottom: 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2),
                        prefixIcon: IconButton(
                          onPressed: () {
                            Get.offAll(const HomePageScreen());
                          },
                          icon: const Icon(Icons.arrow_back_outlined),
                        ),
                        hintText: 'Search',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showSearchBar = false;
                              searchController.clear();
                            });
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                      onChanged: (query) async {
                        List<Map<String, dynamic>> searchResults =
                            await controller.searchLocations(query);

                        setState(() {
                          filteredList = searchResults.map<String>((result) {
                            return result['name'];
                          }).toList();
                        });
                      },
                    ),
                  ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: showSearchBar ? filteredList.length : 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          String selectedLocationName = filteredList[index];
                          List<Map<String, dynamic>> searchResults =
                              await controller
                                  .searchLocations(selectedLocationName);

                          if (searchResults.isNotEmpty) {
                            Map<String, dynamic> selectedLocation =
                                searchResults.first;
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailLocationScreen(
                                  imageURL: selectedLocation['imageURL'] ?? '',
                                  name: selectedLocation['name'] ?? '',
                                  alamat: selectedLocation['address'] ?? '',
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListTile(
                            title: Text(filteredList[index]),
                            subtitle: const Text(
                              'Jl. Terusan Bojongsoang No.174, Baleendah, Kec. Baleendah, Kabupaten Bandung, Jawa Barat 40375',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (showBankList == false)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showBankList = !showBankList;
                        });
                      },
                      child: Container(
                        width: 154,
                        height: 50,
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                          border: Border.all(
                            width: 1,
                            color: AppColors.black.withOpacity(0.2),
                          ),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Lihat daftar',
                            style: Styles.blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: AppFontWeight.medium,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (showBankList)
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showBankList = !showBankList;
                    });
                  },
                  child: const ListBank(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BuildMap extends StatelessWidget {
  const BuildMap({
    super.key,
    required this.controller,
  });

  final FindLocationController controller;
  LatLngBounds getLatLngBounds(List<Map<String, dynamic>> points) {
    List<latLng.LatLng> latLngList = points.map((point) {
      return latLng.LatLng(point['latitude'], point['longitude']);
    }).toList();

    if (latLngList.isNotEmpty) {
      return LatLngBounds.fromPoints(latLngList);
    } else {
      // If the list is empty, provide default coordinates or handle it as needed
      return LatLngBounds(
        const latLng.LatLng(0.0, 0.0), // Default coordinates
        const latLng.LatLng(1.0, 1.0), // Default coordinates
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: latLng.LatLng(
          controller.nearestWasteCollectionPoint['latitude'] ?? 0.0,
          controller.nearestWasteCollectionPoint['longitude'] ?? 0.0,
        ),
        initialZoom: 1.0,
        // ignore: deprecated_member_use
        bounds: getLatLngBounds(controller.wasteCollectionPoints),
        onPositionChanged: (position, hasGesture) {
          // Handle map position changes
        },
      ),
      mapController: controller.mapController,
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            for (var point in controller.findNearestWasteCollectionPoints())
              Marker(
                point: latLng.LatLng(
                  point['latitude'] ?? 0.0,
                  point['longitude'] ?? 0.0,
                ),
                child: const WasteCollectionMarkerWidget(),
              ),
          ],
        )
      ],
    );
  }
}

class UserMarkerWidget extends StatelessWidget {
  const UserMarkerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.location_pin,
      color: Colors.red,
      size: 30.0,
    );
  }
}

class WasteCollectionMarkerWidget extends StatelessWidget {
  const WasteCollectionMarkerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.location_pin,
      color: Colors.red,
      size: 30.0,
    );
  }
}
