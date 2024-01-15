import 'package:ewise/data/model/chat_model.dart';
import 'package:ewise/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController extends GetxController {
  RxList<ChatModel> chats = <ChatModel>[].obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxList<UserModel> users = <UserModel>[].obs;

  void getUsers() {
    try {
      FirebaseFirestore.instance.collection('Users').snapshots().listen(
        (QuerySnapshot<Map<String, dynamic>> snapshot) {
          users.value =
              snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
        },
      );
    } catch (e) {
      // Handle error
      print('Error getting users: $e');
    }
  }

  ChatModel findLastChatWithAdmin(String adminId) {
    String? idUser = getCurrentUserId();

    UserModel? currentUser =
        users.firstWhereOrNull((user) => user.id == idUser);

    bool isAdmin = currentUser?.isAdmin ?? false;

    var adminChats = chats.where((chat) => chat.idAdmin == adminId).toList();

    // /adminChats.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    adminChats.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    String lastMessage =
        adminChats.isNotEmpty ? adminChats.first.lastMessage : '';

    print('adminChats: $adminChats');
    print('lastMessage: $lastMessage');

    return adminChats.isNotEmpty
        ? ChatModel(
            idUser: adminChats.last.idUser,
            idAdmin: adminChats.last.idAdmin,
            message: adminChats.last.message,
            timestamp: adminChats.last.timestamp,
            lastActive: adminChats.last.lastActive,
            lastMessage: lastMessage,
            isAdmin: adminChats.last.isAdmin,
          )
        : ChatModel(
            idUser: idUser ?? '',
            idAdmin: adminId,
            message: '',
            timestamp: DateTime.now(),
            lastActive: DateTime.now(),
            lastMessage: lastMessage,
            isAdmin: isAdmin,
          );
  }

  String? getCurrentUserId() {
    User? user = _auth.currentUser;
    return user?.uid;
  }

  UserModel? findAdminById(String adminId) {
    return users.firstWhereOrNull((user) => user.id == adminId && user.isAdmin);
  }

  void sendMessage(String idAdmin, String message) async {
    String? idUser = getCurrentUserId();

    if (idUser!.isEmpty) {
      // Handle jika idUser kosong
      return;
    }

    try {
      // Fetch the user from the list of users
      UserModel? currentUser =
          users.firstWhereOrNull((user) => user.id == idUser);
      //UserModel? currentUser = users.firstWhere((user) => user.id == idUser);

      // If the current user is an admin, set isAdmin to true, otherwise false
      bool isAdmin = currentUser?.isAdmin ?? false;

      if (kDebugMode) {
        print('Sending message: $message');
      }

      await FirebaseFirestore.instance.collection('chats').add({
        'idUser': idUser,
        'idAdmin': idAdmin,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
        'lastActive': FieldValue.serverTimestamp(),
        'lastMessage': message,
        'isAdmin': isAdmin,
      });

      if (kDebugMode) {
        print('Message sent successfully!');
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error sending message: $e');
      }
    }
  }

  // Mendapatkan pesan dari Firebase
  void getMessages(String idAdmin) {
    try {
      FirebaseFirestore.instance
          .collection('chats')
          .where('idAdmin', isEqualTo: idAdmin)
          .snapshots()
          .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
        chats.value =
            snapshot.docs.map((doc) => ChatModel.fromSnapshot(doc)).toList();
      });
    } catch (e) {
      // Handle error
      print('Error getting messages: $e');
    }
  }
}
