import 'package:cloud_firestore/cloud_firestore.dart';

class PickupModel {
  late final String? pickupId;
  final String userId;

  final String wasteSize;
  final String pickupStatus;
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
  Timestamp timestamp;

  PickupModel({
    this.pickupId,
    required this.userId,
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
    required this.timestamp,
  });

  toJson() {
    return {
      "userId": userId,
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
      'timestamp': timestamp,
    };
  }

  factory PickupModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return PickupModel(
      pickupId: document.id,
      userId: data?['userId'],
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
      timestamp: data?['timestamp'],
    );
  }
}
