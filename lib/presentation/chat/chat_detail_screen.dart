import 'package:ewise/presentation/widgets/chat_item.dart';
import 'package:ewise/presentation/widgets/input_item.dart';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final String nameContact;
  final String assetsImage;

  const ChatDetailScreen({
    Key? key,
    required this.nameContact,
    required this.assetsImage,
  }) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nameContact),
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
            child: ListView(
              children: [
                ChatItem(
                  isAdmin: true,
                  content: 'Titik jemput sudah sesuai ya?',
                  assetImage: widget.assetsImage,
                ),
                ChatItem(
                  isAdmin: false,
                  content: 'Iya teh sudah sesuai',
                  assetImage: widget.assetsImage,
                ),
                ChatItem(
                  isAdmin: true,
                  content: 'Ok ditunggu ya',
                  assetImage: widget.assetsImage,
                ),
              ],
            ),
          ),
          InputItem(
            onTapAdd: () {},
            onTapCamera: () {},
            onTapPicture: () {},
          ),
        ],
      ),
    );
  }
}
