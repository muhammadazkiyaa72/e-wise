import 'package:flutter/material.dart';

class BuildButton extends StatefulWidget {
  const BuildButton({super.key});

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            isFocused = hasFocus;
          });
        },
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(5.0),
                fixedSize:
                    const MaterialStatePropertyAll(Size.fromWidth(290.0)),
                foregroundColor: MaterialStatePropertyAll(isFocused
                    ? const Color.fromRGBO(57, 104, 42, 1)
                    : const Color.fromRGBO(239, 243, 241, 1)),
                backgroundColor: MaterialStatePropertyAll(isFocused
                    ? const Color.fromRGBO(239, 243, 241, 1)
                    : const Color.fromRGBO(57, 104, 42, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))),
            onPressed: () {
              setState(() {
                print("This is clicked!");
              });
            },
            child: const Center(
              child: Text(
                "Buat Akun",
                style: TextStyle(fontSize: 12.0),
              ),
            )),
      ),
    );
  }
}
