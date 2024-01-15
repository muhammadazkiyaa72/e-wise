import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String? id;
  final String idUser;
  final String idAdmin;
  final String message;
  final DateTime timestamp;
  final DateTime lastActive;
  final String lastMessage;
  late final bool isAdmin;

  ChatModel({
    this.id,
    required this.idUser,
    required this.idAdmin,
    required this.message,
    required this.timestamp,
    required this.lastActive,
    required this.lastMessage,
    required this.isAdmin,
  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idAdmin': idAdmin,
      'message': message,
      'timestamp': timestamp,
      'lastActive': lastActive,
      'lastMessage': lastMessage,
      'isAdmin': isAdmin,
    };
  }

  factory ChatModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ChatModel(
      id: document.id,
      idUser: data?['idUser'] ?? '',
      idAdmin: data?['idAdmin'] ?? '',
      message: data?['message'] ?? '',
      timestamp: (data?['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
      lastActive:
          (data?['lastActive'] as Timestamp?)?.toDate() ?? DateTime.now(),
      lastMessage: data?['lastMessage'] ?? '',
      isAdmin: data?['isAdmin'] ?? false,
    );
  }
}
