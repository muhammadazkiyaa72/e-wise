import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final bool isAdmin; // Add a boolean field for admin status

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    this.isAdmin = false, // Set a default value for the isAdmin field
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "isAdmin": isAdmin, // Include the isAdmin field in the toJson method
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      id: document.id,
      fullName: data?['FullName'],
      email: data?["Email"],
      password: data?["Password"],
      isAdmin: data?["isAdmin"] ??
          false, // Use the isAdmin field from the document, or use the default if not present
    );
  }
}
