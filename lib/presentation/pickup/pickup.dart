import 'package:ewise/core/values/api.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/presentation/pickup/components/splash_screen.dart';
import 'package:ewise/presentation/pickup/components/statusbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({super.key});

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  late GoogleMapController mapController;

  // final LatLng _origin = const LatLng(-6.977780881500068, 107.63332967005071);
  final LatLng _destination =
      const LatLng(-6.264261616417689, 106.78302362342993);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void _getCurrentLocation() {
    Location location = Location();

    location.getLocation().then((location) => setState(
          () {
            currentLocation = location;
          },
        ));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        PointLatLng(_destination.latitude, _destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
      setState(() {});
    }
  }

  @override
  void initState() {
    _getCurrentLocation();
    _getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: currentLocation == null
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: EdgeInsets.all(5),
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
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.all(5),
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
      body: currentLocation == null
          ? SplashScreenMaps()
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 15,
                  ),
                  polylines: {
                    Polyline(
                        polylineId: const PolylineId('route'),
                        points: polylineCoordinates,
                        color: AppColors.black,
                        width: 8)
                  },
                  markers: {
                    Marker(
                        markerId: const MarkerId('current location'),
                        position: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!)),
                    // const Marker(
                    //     markerId: MarkerId('destination'),
                    //     position:
                    //         LatLng(-6.264261616417689, 106.78302362342993))
                  },
                ),
                const StatusBar(),
              ],
            ),
    );
  }
}
