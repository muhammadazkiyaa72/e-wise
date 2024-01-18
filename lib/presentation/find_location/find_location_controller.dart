import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as location;
import 'package:location/location.dart';

class FindLocationController extends GetxController {
  late MapController mapController = MapController();
  LocationData? currentLocation;
  Map<String, dynamic> nearestWasteCollectionPoint = {};
  List<Map<String, dynamic>> nearestWasteCollectionPoints = [];

  String? selectedWasteSize;
  String? name;
  String? address;
  double? latitude;
  double? longitude;

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
      // Handle the case where currentLocation is null, perhaps by returning an empty list or throwing an error.
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

    // Get the top three nearest points with ebankLocation
    List<Map<String, dynamic>> nearestPoints = sortedPoints.take(3).toList();

    // Find the corresponding e-banks based on coordinates
    List<Map<String, dynamic>> nearestEbanks = nearestPoints.map((point) {
      var ebank = wasteCollectionPoints.firstWhere(
        (ebank) =>
            ebank['latitude'] == point['latitude'] &&
            ebank['longitude'] == point['longitude'],
      );

      // Merge e-bank details with waste collection point
      return {
        ...point,
        'ebankName': ebank['name'],
        'ebankAddress': ebank['address'],
        // Add other e-bank details as needed
      };
    }).toList();

    return nearestEbanks;
  }

  void getCurrentLocation() {
    location.Location locationService = location.Location();

    locationService.onLocationChanged
        .listen((location.LocationData currentLoc) {
      print("Updated Location: $currentLoc");

      currentLocation = currentLoc;
      nearestWasteCollectionPoints = findNearestWasteCollectionPoints();

      if (nearestWasteCollectionPoints.isNotEmpty) {
        nearestWasteCollectionPoint = nearestWasteCollectionPoints.first;
      } else {
        nearestWasteCollectionPoint =
            {}; // or set it to an appropriate default value
      }

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

      update();
    } catch (e) {
      print("Error getting user location details: $e");
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchEbankDataForNearestPoints() async {
    // Get the top three nearest points with ebankLocation
    List<Map<String, dynamic>> nearestPoints =
        findNearestWasteCollectionPoints();

    // Fetch ebank data from Firestore based on coordinates
    List<Map<String, dynamic>> ebankDataList = [];

    for (var point in nearestPoints) {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection("ebank")
          .where("latitude", isEqualTo: point['latitude'])
          .where("longitude", isEqualTo: point['longitude'])
          .limit(3)
          .get();

      // Extract ebank details
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> ebankData = querySnapshot.docs.first.data();

        ebankDataList.add(ebankData);
      }
    }
    update();
    return ebankDataList;
  }

  Future<List<Map<String, dynamic>>>
      fetchWasteCollectionPointsFromFirestore() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection("ebank").get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching waste collection points: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> searchLocations(String query) async {
    // Fetch waste collection points from Firestore
    List<Map<String, dynamic>> wasteCollectionPoints =
        await fetchWasteCollectionPointsFromFirestore();

    // Filter wasteCollectionPoints based on the search query
    List<Map<String, dynamic>> filteredLocations = wasteCollectionPoints
        .where((location) =>
            location['name'].toLowerCase().contains(query.toLowerCase()) ||
            location['address'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    update();
    return filteredLocations;
  }

  Future<void> initPage() async {
    getCurrentLocation();
    await getUserLocationDetails();
    await fetchEbankDataForNearestPoints();
  }
}
