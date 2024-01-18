import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String assetImage;
  final String nameContact;
  final String lastChat;
  final String date;
  final VoidCallback onPressed;
  const ContactItem({
    super.key,
    required this.assetImage,
    required this.nameContact,
    required this.lastChat,
    required this.date,
    required this.onPressed,
  
  });

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          const SizedBox(
            height: 11,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Stack(
              children: [
                Positioned(
                  left: 66,
                  top: 10,
                  child: Text(
                    nameContact,
                    style: Styles.blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 66,
                  top: 39,
                  child: Text(
                    lastChat,
                    style: Styles.blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ),
                Positioned(
                  left: isLandscape ? null : 251,
                  right: isLandscape ? 0 : null,
                  top: 0,
                  child: Text(
                    date,
                    textAlign: TextAlign.right,
                    style: Styles.blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(assetImage),
                        fit: BoxFit.cover,
                      ),
                      shape: const OvalBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFCAC4D0),
          )
        ],
      ),
    );
  }
}
