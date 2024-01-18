import 'package:ewise/presentation/pickup/pickup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'package:ewise/core/values/colors.dart';
import 'package:ewise/presentation/pickup/components/statusbar.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({super.key});

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  final PickupController pickupController = Get.put(PickupController());
  late MapTileLayerController mapController;

  @override
  void initState() {
    super.initState();
    initPage();
  }

  Future<void> initPage() async {
    await pickupController.initPage();

    pickupController.update();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Stack(
          children: [
            BuildMap(controller: pickupController),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 47,
                    height: 47,
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
                      onPressed: () {
                        // Fokus ke lokasi pengguna
                      },
                      icon: const Icon(Icons.my_location),
                    ),
                  ),
                ],
              ),
            ),
            StatusBar(pickupController: pickupController),
          ],
        ),
      ),
    );
  }
}

class BuildMap extends StatefulWidget {
  const BuildMap({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PickupController controller;

  @override
  State<BuildMap> createState() => _BuildMapState();
}

class _BuildMapState extends State<BuildMap> {
  LatLngBounds getLatLngBounds(PickupController controller) {
    double userLatitude = controller.currentLocation?.latitude ?? 0.0;
    double userLongitude = controller.currentLocation?.longitude ?? 0.0;

    if (userLatitude != 0.0 && userLongitude != 0.0) {
      return LatLngBounds(
        latLng.LatLng(userLatitude, userLongitude),
        latLng.LatLng(userLatitude, userLongitude),
      );
    } else {
      return LatLngBounds(
        const latLng.LatLng(0.0, 0.0),
        const latLng.LatLng(1.0, 1.0),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initMap();
  }

  Future<void> initMap() async {
    try {
      await widget.controller.initPage();
      widget.controller.update();
    } catch (e) {
      print("Error initializing map: $e");
      // Handle the error, display a relevant message, or take appropriate action.
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationData?>(
      future: widget.controller.getCurrentLocation(),
      builder: (BuildContext context, AsyncSnapshot<LocationData?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Center(child: Text("Error fetching location"));
        } else {
          return FlutterMap(
            options: MapOptions(
              initialCenter: latLng.LatLng(
                widget.controller.currentLocation?.latitude ?? 0.0,
                widget.controller.currentLocation?.longitude ?? 0.0,
              ),
              initialZoom: 17.0,
            ),
            mapController: widget.controller.mapController,
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: latLng.LatLng(
                      widget.controller.currentLocation?.latitude ?? 0.0,
                      widget.controller.currentLocation?.longitude ?? 0.0,
                    ),
                    child: const UserMarkerWidget(),
                  ),
                ],
              ),
            ],
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
