import 'package:ewise/presentation/chat/chat_controller.dart';
import 'package:ewise/presentation/widgets/chat_item.dart';
import 'package:ewise/presentation/widgets/input_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailScreen extends StatefulWidget {
  final String adminId;
  final String adminName;
  //final String userId;

  const ChatDetailScreen({
    Key? key,
    required this.adminId,
    required this.adminName,
    // required this.userId,
  }) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController messageController = TextEditingController();

  final ChatController chatController = Get.put(ChatController());

  @override
  void initState() {
    chatController.getMessages(widget.adminId);
    super.initState();
    // Start listening to real-time updates

    // Fetch users and set the admin email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.adminName),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.call_outlined,
              size: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.search,
              size: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.more_vert,
              size: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              var adminChats = chatController.chats
                  .where((chat) => chat.idAdmin == widget.adminId)
                  .toList();
              return ListView.builder(
                itemCount: adminChats.length,
                itemBuilder: (context, index) {
                  var chat = adminChats[index];
                  return ChatItem(
                    isAdmin: chat.isAdmin,
                    content: chat.message,
                    assetImage: 'assets/icons/ic_user.png',
                  );
                },
              );
            }),
          ),
          // UI untuk mengirim pesan baru
          InputItem(
            messageController: messageController,
            onTapAdd: () {
              chatController.sendMessage(
                widget.adminId,
                messageController.text,
              );
              messageController.clear();
            },
            onTapCamera: () {},
            onTapPicture: () {},
          ),
        ],
      ),
    );
  }
}
