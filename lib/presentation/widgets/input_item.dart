import 'package:ewise/core/values/colors.dart';
import 'package:flutter/material.dart';

class InputItem extends StatefulWidget {
  final Function()? onTapAdd;
  final GestureTapCallback? onTapCamera;
  final GestureTapCallback? onTapPicture;
  const InputItem(
      {super.key, this.onTapAdd, this.onTapCamera, this.onTapPicture});

  @override
  State<InputItem> createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
                controller: _textEditingController,
                onChanged: (text) {
                  setState(
                      () {}); // Trigger a rebuild to update button visibility
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
          if (_textEditingController.text.isNotEmpty)
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
