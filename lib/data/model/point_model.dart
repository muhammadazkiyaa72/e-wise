import 'package:cloud_firestore/cloud_firestore.dart';

class PointModel {
  final String? id;
  final String idUser;
  final double point;
  final double masuk;
  final double keluar;

  PointModel({
    this.id,
    required this.idUser,
    this.point = 10,
    this.masuk = 0,
    this.keluar = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'point': point,
      'masuk': masuk,
      'keluar': keluar,
    };
  }

  factory PointModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return PointModel(
      id: document.id,
      idUser: data?['idUser'] ?? '',
      point: data?['point'] ?? '',
      masuk: data?['masuk'] ?? '',
      keluar: data?['keluar'] ?? '',
    );
  }
}
