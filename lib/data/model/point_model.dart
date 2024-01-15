import 'package:cloud_firestore/cloud_firestore.dart';

class PointModel {
  final String? id;
  final String idUser;
  final double point;

  PointModel({
    this.id,
    required this.idUser,
    this.point = 10,
  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'point': point,
    };
  }

  factory PointModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return PointModel(
      id: document.id,
      idUser: data?['idUser'] ?? '',
      point: data?['point'] ?? '',
    );
  }
}
