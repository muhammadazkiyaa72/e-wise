import 'package:ewise/core/values/colors.dart';
import 'package:flutter/material.dart';

class InputItem extends StatefulWidget {
  final Function()? onTapAdd;
  final GestureTapCallback? onTapCamera;
  final GestureTapCallback? onTapPicture;
  final TextEditingController messageController; // Marked as required

  const InputItem({
    Key? key,
    required this.onTapAdd,
    required this.onTapCamera,
    required this.onTapPicture,
    required this.messageController, // Marked as required
  }) : super(key: key);

  @override
  State<InputItem> createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 76,
      color: const Color(0xffF3F4F9),
      child: Row(
        children: [
          IconButton(
            onPressed: widget.onTapCamera,
            icon: Image.asset(
              'assets/icons/ic_camera.png',
              width: 24,
            ),
          ),
          IconButton(
            onPressed: widget.onTapPicture,
            icon: Image.asset(
              'assets/icons/ic_image.png',
              width: 24,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 248,
              height: 44,
              child: TextFormField(
                controller: widget.messageController,
                onChanged: (text) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  hintText: 'Message',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ),
          ),
          if (widget.messageController.text.isNotEmpty)
            IconButton(
              onPressed: widget.onTapAdd,
              icon: const Icon(Icons.send),
              color: AppColors.t40,
            ),
        ],
      ),
    );
  }
}
