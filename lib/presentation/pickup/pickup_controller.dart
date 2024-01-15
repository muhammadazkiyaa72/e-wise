import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:location/location.dart' as location;
import 'package:location/location.dart';

import 'package:ewise/core/values/api.dart';
import 'package:ewise/data/model/pickup_model.dart';

class PickupController extends GetxController {
  late MapController mapController = MapController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? selectedWasteSize;
  String? name;
  String? address;
  double? latitude;
  double? longitude;
  late TextEditingController pickupLocationController;
  late TextEditingController ebankController;
  late TextEditingController scheduleController;
  late TextEditingController notesController;

  @override
  void onInit() {
    pickupLocationController = TextEditingController();
    ebankController = TextEditingController();
    scheduleController = TextEditingController();
    notesController = TextEditingController();
    super.onInit();
    update();
  }

  final List<Map<String, dynamic>> wasteCollectionPoints = [
    {
      'name': 'Bandung Indah Plaza',
      'address': 'Jl. Merdeka No.56, Citarum, Kec. Bandung Wetan, Kota Bandung',
      'latitude': -6.908710,
      'longitude': 107.610940,
    },
    {
      'name': 'SMAN 5 Bandung',
      'address': 'Jl. Belitung No.8, Merdeka, Kec. Sumur Bandung, Kota Bandung',
      'latitude': -6.915120,
      'longitude': 107.610450,
    },
    {
      'name': 'Kantor Kecamatan Rancasari',
      'address':
          'Jalan Bumi Santosa No.12, Rancasari, Cipamokolan, Kota Bandung',
      'latitude': -6.946980,
      'longitude': 107.675650,
    },
    // Add other waste collection points here
    {
      'name': 'Kantor Kecamatan Mandalajati',
      'address':
          'Jl. Pasir Impun No.33, Karang Pamulang, Kec. Mandalajati, Kota Bandung',
      'latitude': -6.896540,
      'longitude': 107.676590,
    },
    {
      'name': 'Kantor Dinas Lingkungan Hidup Kota Bandung',
      'address':
          'Jl. Sadang Tengah No.4-6, Sekeloa, Kecamatan Coblong, Kota Bandung',
      'latitude': -6.8901991,
      'longitude': 107.6244591,
    },
    {
      'name': 'Sekolah Kang Pisman',
      'address':
          'Jl. Soekarno Hatta No.187A, Kebonlega Kec. Bojongloa Kidul, Kota Bandung',
      'latitude': -6.9497574,
      'longitude': 107.5979888,
    },
    {
      'name': 'SMAN 3 Bandung',
      'address': 'Jl. Belitung No.8, Merdeka, Kec. Sumur Bandung, Kota Bandung',
      'latitude': -6.9123204,
      'longitude': 107.6124586,
    },
    {
      'name': 'Kantor Kelurahan Cisaranten Kulon',
      'address':
          'Jl. Cisaranten Kulon No.127, Cisaranten Kulon, Kec. Arcamanik, Kota Bandung',
      'latitude': -6.9244725,
      'longitude': 107.6809706,
    },
    {
      'name': 'Kantor Kecamatan Cibeunying Kaler',
      'address':
          'Jl. Cigadung Selatan No. 100c, Cigadung, Kec. Cibeunying Kaler, Kota Bandung',
      'latitude': -6.8858774,
      'longitude': 107.6237928,
    },
    {
      'name': 'SMKN 5 Bandung',
      'address':
          'Jl. Bojong Koneng No.37A, Sukapada, Kec. Cibeunying Kidul, Kota Bandung',
      'latitude': -6.8914957,
      'longitude': 107.6426034,
    },
  ];
  List<latLng.LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  Map<String, dynamic> nearestWasteCollectionPoint = {};

  void getCurrentLocation() {
    location.Location locationService = location.Location();

    locationService.onLocationChanged
        .listen((location.LocationData currentLoc) {
      print("Updated Location: $currentLoc");

      currentLocation = currentLoc;
      nearestWasteCollectionPoint = findNearestWasteCollectionPoint();

      // Fetch user location details when location changes
      getUserLocationDetails();

      update();
    });
  }

  Future<void> getUserLocationDetails() async {
    try {
      location.Location locationService = location.Location();

      // Check if location services are enabled
      bool serviceEnabled = await locationService.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await locationService.requestService();
        if (!serviceEnabled) {
          // Handle case where location services are not enabled
          return;
        }
      }

      // Get the current location
      LocationData currentLoc = await locationService.getLocation();

      // Get location details using Geocoding
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLoc.latitude!,
        currentLoc.longitude!,
      );

      // Extracting location details
      name = placemarks.first.name ?? "";
      String thoroughfare = placemarks.first.thoroughfare ?? "";
      String subThoroughfare = placemarks.first.subThoroughfare ?? "";
      String locality = placemarks.first.locality ?? "";
      String subLocality = placemarks.first.subLocality ?? "";

      // Construct a clearer address
      address = "$name $subThoroughfare $thoroughfare, $subLocality $locality";
      latitude = currentLoc.latitude!;
      longitude = currentLoc.longitude!;

      // Update controllers for location fields
      pickupLocationController.text = address!;
      ebankController.text = nearestWasteCollectionPoint['name'] ?? "";

      // Use the location details as needed
      print("Location Name: $name");
      print("Location Address: $address");
      print("Latitude: $latitude");
      print("Longitude: $longitude");

      // Update the UI or save the location details as needed
      update();
    } catch (e) {
      print("Error getting user location details: $e");
    }
  }

  void getPolyPoints() async {
    if (currentLocation != null) {
      PolylinePoints polylinePoints = PolylinePoints();

      try {
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleApiKey,
          PointLatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
          PointLatLng(
            wasteCollectionPoints.first['latitude'],
            wasteCollectionPoints.first['longitude'],
          ),
        );

        if (result.points.isNotEmpty) {
          polylineCoordinates.clear();
          for (var point in result.points) {
            polylineCoordinates
                .add(latLng.LatLng(point.latitude, point.longitude));
          }
          print("Polyline Coordinates: $polylineCoordinates");
          update();
        }
      } catch (e) {
        print("Error getting polyline points: $e");
      }
    }
  }

  Map<String, dynamic> findNearestWasteCollectionPoint() {
    Map<String, dynamic>? nearestPoint;
    double minDistance = double.infinity;

    if (currentLocation != null) {
      for (var point in wasteCollectionPoints) {
        double distance = Geolocator.distanceBetween(
          currentLocation!.latitude!,
          currentLocation!.longitude!,
          point['latitude'],
          point['longitude'],
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestPoint = point;
        }
      }
    }
    // Update controller for e-Waste Bank location field
    ebankController.text = nearestPoint?['name'] ?? "";

    return nearestPoint ?? {};
  }

  void _getCurrentUserId() {
    User? user = _auth.currentUser;

    if (user != null) {
      String userId = user.uid;
      print("Current User ID: $userId");
      // Set userId to your PickupModel or use it as needed.
    } else {
      print("No user is currently logged in.");
      // Implement logic for handling no logged-in user, such as navigating to the login screen.
    }
  }

  void submitPickupForm() async {
    String pickupLocation = pickupLocationController.text;
    String schedule = scheduleController.text;
    String notes = notesController.text;

    User? user = _auth.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    Map<String, dynamic> nearestEbank = findNearestWasteCollectionPoint();

    // Create a new PickupModel instance
    PickupModel pickupModel = PickupModel(
      userId: userId,
      wasteSize: selectedWasteSize ?? "",
      pickupStatus: "Konfirmasi", // Initial status
      pickupAddress: pickupLocation,
      ebankName: nearestEbank['name'] ??
          "", // Replace with your logic for getting ebank name
      ebankAddress: nearestEbank['address'] ??
          "", // Replace with your logic for getting ebank address
      ebankLatitude: nearestEbank['latitude'] ?? 0.0,
      ebankLongitude: nearestEbank['longitude'] ?? 0.0,
      userPlace: name ?? "", // User details
      userAddress: address ?? "", // User details
      userLatitude: latitude ?? 0.0, // User details
      userLongitude: longitude ??
          0.0, // User details // Replace with your logic for getting user address
      pickupDate: schedule,
      notes: notes,
    );

    // Save the pickup information to Firebase
    try {
      await FirebaseFirestore.instance
          .collection('pickups')
          .add(pickupModel.toJson());
      // Show success message or navigate to the next screen
    } catch (e) {
      print("Error submitting pickup form: $e");
      // Show error message
    }
  }
}
