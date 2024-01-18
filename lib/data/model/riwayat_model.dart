import 'package:cloud_firestore/cloud_firestore.dart';

class RiwayatModel {
  final String? id;
  final String idUser;
  final double pointTukar;
  final double uang;
  final String ewallete;
  final String akun;
  final bool tukar;
  final DateTime timestamp;

  RiwayatModel({
    this.id,
    required this.idUser,
    required this.pointTukar,
    required this.uang,
    required this.ewallete,
    required this.akun,
    required this.tukar,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'pointTukar': pointTukar,
      'uang': uang,
      'ewallete': ewallete,
      'akun': akun,
      'tukar': tukar,
      'timestamp': timestamp,
    };
  }

  factory RiwayatModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return RiwayatModel(
      id: document.id,
      idUser: data?['idUser'] ?? '',
      pointTukar: data?['poinTukar'] ?? 0.0,
      uang: data?['uang'] ?? 0.0,
      ewallete: data?['ewallete'] ?? '',
      akun: data?['akun'] ?? '',
      tukar: data?['tukar'] ?? '',
      timestamp: (data?['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
