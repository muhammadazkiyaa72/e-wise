import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatefulWidget {
  final bool isAdmin;
  final String content;
  final String assetImage;
  const ChatItem({
    Key? key,
    required this.isAdmin,
    required this.assetImage,
    required this.content,
  }) : super(key: key);

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.isAdmin == true) {
      return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.assetImage),
                      fit: BoxFit.cover,
                    ),
                    shape: const OvalBorder(),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Card(
                    color: AppColors.n95,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        textAlign: TextAlign.justify,
                        widget.content,
                        style: Styles.blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: AppFontWeight.regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Card(
                    color: AppColors.s40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        textAlign: TextAlign.justify,
                        widget.content,
                        style: Styles.whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: AppFontWeight.regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
