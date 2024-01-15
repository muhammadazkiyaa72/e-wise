import 'package:cloud_firestore/cloud_firestore.dart';

class PickupModel {
  final String userId; // ID of the user who is currently logged in
  final String? pickupId; // Automatically generated pickup ID in Firebase
  final String wasteSize;
  final String
      pickupStatus; // Possible values: 'Konfirmasi', 'Pickup', 'Selesai'
  final String pickupAddress;
  final String ebankName;
  final String ebankAddress;
  final double ebankLatitude;
  final double ebankLongitude;
  final String userPlace;
  final String userAddress;
  final double userLatitude;
  final double userLongitude;
  final String pickupDate;
  final String notes;

  PickupModel({
    required this.userId,
    this.pickupId,
    required this.wasteSize,
    required this.pickupStatus,
    required this.pickupAddress,
    required this.ebankName,
    required this.ebankAddress,
    required this.ebankLatitude,
    required this.ebankLongitude,
    required this.userPlace,
    required this.userAddress,
    required this.userLatitude,
    required this.userLongitude,
    required this.pickupDate,
    required this.notes,
  });

  toJson() {
    return {
      "userId": userId,
      "pickupId": pickupId,
      "wasteSize": wasteSize,
      "pickupStatus": pickupStatus,
      "pickupAddress": pickupAddress,
      "ebankName": ebankName,
      "ebankAddress": ebankAddress,
      "ebankLatitude": ebankLatitude,
      "ebankLongitude": ebankLongitude,
      "userPlace": userPlace,
      "userAddress": userAddress,
      "userLatitude": userLatitude,
      "userLongtitude": userLongitude,
      "pickupDate": pickupDate,
      "notes": notes,
    };
  }

  factory PickupModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return PickupModel(
      userId: data?['userId'],
      pickupId: document.id,
      wasteSize: data?['wasteSize'],
      pickupStatus: data?['pickupStatus'],
      pickupAddress: data?['pickupAddress'],
      ebankName: data?['ebankName'],
      ebankAddress: data?['ebankAddress'],
      ebankLatitude: data?['ebankLatitude'],
      ebankLongitude: data?['ebankLongitude'],
      userPlace: data?['userPlace'],
      userAddress: data?['userAddress'],
      userLatitude: data?['userLatitude'],
      userLongitude: data?['userLongtitude'],
      pickupDate: data?['pickupDate'],
      notes: data?['notes'], 
    );
  }
}
