import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewise/core/values/api.dart';
import 'package:ewise/data/model/pickup_model.dart';
import 'package:ewise/data/model/riwayat_model.dart';
import 'package:ewise/data/repository/auth_repository.dart';
import 'package:ewise/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as location;
import 'package:latlong2/latlong.dart' as latLng;
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class PickupController extends GetxController {
  final _authRepo = Get.find<AuthRepository>();
  late MapController mapController = MapController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userRepo = Get.put(UserRepository());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxDouble userPoints = 0.0.obs;
  RxDouble poinMasuk = 0.0.obs;
  RxDouble poinKeluar = 0.0.obs;
  RxDouble selectedNominal = 0.0.obs;
  RxDouble nominal = 0.0.obs;
  RxString ewallet = ''.obs;
  RxString akun = ''.obs;

  LocationData? currentLocation;
  Map<String, dynamic> nearestWasteCollectionPoint = {};
  List<Map<String, dynamic>> nearestWasteCollectionPoints = [];
  List<latLng.LatLng> polylineCoordinates = [];

  String? selectedWasteSize;
  String? name;
  String? address;
  double? latitude;
  double? longitude;

  bool isMarkerDraggable = false;

  late MapTileLayerController mapsController;
  List<MapLatLng> mapMarkers = [];

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
    mapsController = MapTileLayerController();

    getCurrentLocation();
    getUserLocationDetails();

    findNearestWasteCollectionPoints();
    findNearestWasteCollectionPoint();
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
  List<Map<String, dynamic>> findNearestWasteCollectionPoints() {
    if (currentLocation == null) {
      return [];
    }

    List<Map<String, dynamic>> sortedPoints = List.from(wasteCollectionPoints);

    sortedPoints.sort((a, b) {
      double distanceA = Geolocator.distanceBetween(
        currentLocation!.latitude!,
        currentLocation!.longitude!,
        a['latitude'],
        a['longitude'],
      );

      double distanceB = Geolocator.distanceBetween(
        currentLocation!.latitude!,
        currentLocation!.longitude!,
        b['latitude'],
        b['longitude'],
      );

      return distanceA.compareTo(distanceB);
    });

    List<Map<String, dynamic>> nearestPoints = sortedPoints.take(3).toList();

    List<Map<String, dynamic>> nearestEbanks = nearestPoints.map((point) {
      var ebank = wasteCollectionPoints.firstWhere(
        (ebank) =>
            ebank['latitude'] == point['latitude'] &&
            ebank['longitude'] == point['longitude'],
      );

      return {
        ...point,
        'ebankName': ebank['name'],
        'ebankAddress': ebank['address'],
      };
    }).toList();

    return nearestEbanks;
  }

  Future<LocationData?> getCurrentLocation() async {
    try {
      location.Location locationService = location.Location();
      locationService.changeSettings(
        accuracy: location.LocationAccuracy.high,
        distanceFilter: 10.0,
      );

      LocationData? currentLoc = await locationService.getLocation();
      currentLocation = currentLoc;
      nearestWasteCollectionPoints = findNearestWasteCollectionPoints();

      if (nearestWasteCollectionPoints.isNotEmpty) {
        nearestWasteCollectionPoint = nearestWasteCollectionPoints.first;
      } else {
        nearestWasteCollectionPoint = {};
      }
// Only update user location details if service is enabled
      if (await locationService.serviceEnabled()) {
        await getUserLocationDetails();
        findNearestWasteCollectionPoints();
      }

      await getUserLocationDetails();
      update();
      return currentLoc;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting current location: $e");
      }
      return null;
    }
  }

  Future<void> getUserLocationDetails() async {
    try {
      final locationService = location.Location();

      // Get the current location
      final currentLoc = await locationService.getLocation();

      // Check if location services are enabled
      bool serviceEnabled = await locationService.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await locationService.requestService();
        if (!serviceEnabled) {
          // Handle case where location services are not enabled
          return;
        }
      }

      // Get location details using Geocoding
      final placemarks = await placemarkFromCoordinates(
        currentLoc.latitude!,
        currentLoc.longitude!,
      );

      // Extracting location details
      final name = placemarks.first.name ?? "";
      final thoroughfare = placemarks.first.thoroughfare ?? "";
      final subThoroughfare = placemarks.first.subThoroughfare ?? "";
      final locality = placemarks.first.locality ?? "";
      final subLocality = placemarks.first.subLocality ?? "";

      // Construct a clearer address
      final address =
          "$name $subThoroughfare $thoroughfare, $subLocality $locality";
      final latitude = currentLoc.latitude!;
      final longitude = currentLoc.longitude!;

      // Update variables with user details
      this.name = name;
      this.address = address;
      this.latitude = latitude;
      this.longitude = longitude;

      // Use the location details as needed
      print("Location Name: $name");
      print("Location Address: $address");
      print("Latitude: $latitude");
      print("Longitude: $longitude");

      // Update controllers for location fields
      pickupLocationController.text = address;

      // Fetch the nearest e-bank based on waste collection points
      nearestWasteCollectionPoints = findNearestWasteCollectionPoints();
      if (nearestWasteCollectionPoints.isNotEmpty) {
        nearestWasteCollectionPoint = nearestWasteCollectionPoints.first;
        ebankController.text = nearestWasteCollectionPoint['name'] ?? "";
      } else {
        ebankController.text = "";
        nearestWasteCollectionPoint = {};
      }
      print("ebank: $nearestWasteCollectionPoint?['name']");
      update();
    } catch (e) {
      print("Error getting user location details: $e");
    }
  }

  Future<void> initPage() async {
    getCurrentLocation();
    getUserLocationDetails();
    findNearestWasteCollectionPoints();
    update();
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
      notes: notes, timestamp: Timestamp.now(),
    );

    // Save the pickup information to Firebase
    try {
      await FirebaseFirestore.instance
          .collection('pickups')
          .add(pickupModel.toJson())
          .whenComplete(() {
        Get.snackbar('Success', 'Mohon Tunggu Akan Segera diProses');
      });
      // Show success message or navigate to the next screen
    } catch (e) {
      print("Error submitting pickup form: $e");
      // Show error message
    }
  }

  Future<void> updateUserPoints() async {
    final userEmail = _authRepo.firebaseUser?.email;
    if (userEmail != null) {
      final points = await _userRepo.getUserPoints(userEmail);
      final wisePointData = await _userRepo.getUserWisePoints(userEmail);

      userPoints.value = points;
      poinMasuk.value = wisePointData.masuk;
      poinKeluar.value = wisePointData.keluar;

      update();
    }
  }

  Future<void> updateLastPickupStatus(String newStatus) async {
    try {
      final userEmail = _authRepo.firebaseUser?.email;
      var points;
      if (userEmail != null) {
        var statusQuery = await FirebaseFirestore.instance
            .collection('pickups')
            .where('pickupStatus', isEqualTo: 'Konfirmasi')
            .get();
        var statusQueryData = statusQuery.docs.first.data();
        var status = statusQueryData['wasteSize'] ?? '';

        // Update user points
        var userPointsQuery = await FirebaseFirestore.instance
            .collection('points')
            .where('idUser', isEqualTo: userEmail)
            .get();
        var userPointsData = userPointsQuery.docs.first.data();
        points = userPointsData['masuk'] ?? 0.0;

        await updateUserPoints();
        final newPoints;
        // Deduct the selected nominal from user points
        if (status == 'Kecil') {
          newPoints = 20.0;
        } else if (status == 'Sedang') {
          newPoints = 40.0;
        } else {
          newPoints = 60.0;
        }

        // Update user points in Firestore
        await updateUserPoints();

        // Update the existing document in the "points" collection
        await FirebaseFirestore.instance
            .collection('points')
            .doc(userPointsQuery.docs.first.id) // Specify the document ID
            .update({
          'point': userPoints.value + newPoints,
          'masuk': points + newPoints,
        });

        selectedNominal.value = newPoints;

        final riwayatDoc = RiwayatModel(
          idUser: userEmail,
          pointTukar: nominal.value,
          uang: selectedNominal.value,
          ewallete: '',
          akun: '',
          tukar: false,
          timestamp: DateTime.now(),
        ).toJson();

        await FirebaseFirestore.instance.collection('riwayat').add(riwayatDoc);
        // Query pickups for the current user
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
            .collection('pickups')
            .where('pickupStatus', isEqualTo: 'Konfirmasi')
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Retrieve the latest pickup
          DocumentSnapshot<Map<String, dynamic>> lastPickupDoc =
              querySnapshot.docs.first;

          // Update the status of the last pickup
          await _firestore
              .collection('pickups')
              .doc(lastPickupDoc.id)
              .update({'pickupStatus': newStatus}).whenComplete(() {
            Get.snackbar('Success', 'Pesenan Telah Selesai dilakukan!');
          });

          // Notify listeners or update local state if needed
          update();
        } else {
          print('No pickups found for the user.');
        }
      }
    } catch (e) {
      print('Error updating last pickup status: $e');
    }
  }
}
