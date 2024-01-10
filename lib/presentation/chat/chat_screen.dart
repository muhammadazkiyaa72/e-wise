import 'package:flutter/material.dart';
import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/widgets/contact_item.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

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
              const ContactItem(
                assetImage: 'assets/img/iksan.png',
                nameContact: 'Iksan Risandy',
                date: '10/01/2024',
                lastChat: 'Permisi, saya sudah di depan',
              ),
              const ContactItem(
                assetImage: 'assets/img/haulul.png',
                nameContact: 'Haulul Azkiyaa',
                date: '01/01/2024',
                lastChat: 'Baik kak',
              ),
              const ContactItem(
                assetImage: 'assets/img/brian.png',
                nameContact: 'Brian Anashari',
                date: '28/12/2023',
                lastChat: 'Boleh banget kak',
              ),
              const ContactItem(
                assetImage: 'assets/img/wendy.png',
                nameContact: 'Wendy',
                date: '24/12/2023',
                lastChat: 'Ok ditunggu ya',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
