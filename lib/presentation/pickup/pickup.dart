import 'package:ewise/presentation/pickup/pickup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

// ignore: library_prefixes
import 'package:latlong2/latlong.dart' as latLng;

import 'package:ewise/core/values/colors.dart';
import 'package:ewise/presentation/pickup/components/splash_screen.dart';
import 'package:ewise/presentation/pickup/components/statusbar.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({super.key});

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  final PickupController pickupController = Get.put(PickupController());

  @override
  void initState() {
    initPage();
    super.initState();
  }

  Future<void> initPage() async {
    pickupController.getCurrentLocation();
    await pickupController.getUserLocationDetails();
    setState(() {}); // Trigger a rebuild after fetching location details
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: pickupController.getUserLocationDetails(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreenMaps();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ]),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.my_location),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: latLng.LatLng(
                      pickupController.currentLocation!.latitude!,
                      pickupController.currentLocation!.longitude!,
                    ),
                    //initialCenter: const latLng.LatLng(-6.9730017, 107.6291105),
                    initialZoom: 15.0,
                    bounds: LatLngBounds.fromPoints([
                      latLng.LatLng(
                        pickupController.currentLocation!.latitude!,
                        pickupController.currentLocation!.longitude!,
                      ), // User's position
                      latLng.LatLng(
                        pickupController
                                .nearestWasteCollectionPoint['latitude'] ??
                            0.0,
                        pickupController
                                .nearestWasteCollectionPoint['longitude'] ??
                            0.0,
                      ), // Nearest waste collection point
                    ]),
                    onPositionChanged: (position, hasGesture) {
                      // Handle map position changes
                    },
                  ),
                  mapController: pickupController.mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: pickupController.polylineCoordinates,
                          strokeWidth: 8.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        // Marker for user's position
                        Marker(
                          point: latLng.LatLng(
                            pickupController.currentLocation!.latitude!,
                            pickupController.currentLocation!.longitude!,
                          ),
                          /* point: latLng.LatLng(
                                currentLocation!.latitude!,
                                currentLocation!.longitude!,
                              ), */
                          child: const UserMarkerWidget(),
                        ),
                        // Marker for the nearest waste collection point (e.g., "eBank")
                        Marker(
                          point: latLng.LatLng(
                            pickupController
                                .nearestWasteCollectionPoint['latitude'],
                            pickupController
                                .nearestWasteCollectionPoint['longitude'],
                          ),
                          child: const WasteCollectionMarkerWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
                StatusBar(pickupController: pickupController),
              ],
            ),
          );
        }
      },
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
