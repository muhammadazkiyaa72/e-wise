import 'package:ewise/presentation/chat/chat_controller.dart';
import 'package:ewise/presentation/chat/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/widgets/contact_item.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = ChatController();
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    chatController.getUsers();

    // Check if there are any admins
    if (chatController.users.isNotEmpty) {
      // Fetch messages for the first admin in the list
      String adminId =
          chatController.users.firstWhere((user) => user.isAdmin).id ?? '';
      chatController.getMessages(adminId);

      Future.delayed(const Duration(seconds: 1), () {
        // Find the last chat with the specific admin
        var chat = chatController.findLastChatWithAdmin(adminId);
        print('Last Message: ${chat.lastMessage}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              if (isSearching)
                SizedBox(
                  height: 44,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(2),
                      prefixIcon: const Icon(Icons.search_outlined),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSearching = false;
                            searchController.clear();
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    onChanged: (value) {
                      // Implement search logic here
                    },
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chat',
                      style: Styles.blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = !isSearching;
                        });
                      },
                      icon: const Icon(Icons.search_outlined),
                    )
                  ],
                ),
              const SizedBox(
                height: 9,
              ),
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: chatController.users.length,
                  itemBuilder: (context, index) {
                    var user = chatController.users[index];
                    //var chatAdmin = chatController.chats[index];
                    if (user.isAdmin) {
                      var chat = chatController.findLastChatWithAdmin(user.id!);
                      return ContactItem(
                        assetImage: 'assets/icons/ic_user.png',
                        nameContact: user.fullName,
                        date: '${chat.lastActive}',
                        lastChat: ' Halo Juga Ka',
                        onPressed: () {
                          // Pass idUser to sendMessage

                          Get.to(() => ChatDetailScreen(
                                adminId: chat.idUser,
                                adminName: user.fullName,
                              ));
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
