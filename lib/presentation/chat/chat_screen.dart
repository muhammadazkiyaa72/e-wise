import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
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
                  onPressed: () {},
                  icon: const Icon(Icons.search_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
