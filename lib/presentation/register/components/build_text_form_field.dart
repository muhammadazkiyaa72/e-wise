import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:flutter/material.dart';

class BuildTextFormField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final String helperText;

  const BuildTextFormField({
    super.key,
    required this.labelText,
    this.helperText = "Gunakan kombinasi huruf dan angka ex brian18",
    this.isPassword = false,
  });

  @override
  State<BuildTextFormField> createState() => _BuildTextFormFieldState();
}

class _BuildTextFormFieldState extends State<BuildTextFormField> {
  late final TextEditingController _controller;
  final double helperFontSize = 8.0;
  final double hideIconSize = 25.0;
  var visible = false;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.labelText == "Kata Sandi" ||
                widget.labelText == "Konfirmasi Kata Sandi"
            ? !visible
            : visible,
        autocorrect: false,
        enableSuggestions: false,
        keyboardType:
            widget.labelText == 'Email' ? TextInputType.emailAddress : null,
        controller: _controller,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(16, 1, 16, 1),
            filled: true,
            fillColor: AppColors.a10,
            labelText: widget.labelText,
            labelStyle: Styles.blackTextStyle,
            helperText:
                widget.labelText == "Kata Sandi" ? widget.helperText : null,
            helperStyle: TextStyle(
                color: AppColors.n40,
                fontSize: helperFontSize,
                fontWeight: AppFontWeight.regular),
            suffixIcon: Visibility(
              visible: widget.isPassword ? true : false,
              child: IconButton(
                icon: Icon(
                  visible ? Icons.visibility : Icons.visibility_off,
                  size: hideIconSize,
                ),
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
              ),
            ),
            focusColor: AppColors.white,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.p50,
                width: 3.0,
              ),
            )));
  }
}
