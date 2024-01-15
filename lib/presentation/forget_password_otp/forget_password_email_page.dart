import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/forget_password_otp/forget_password_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordEmailPage extends StatefulWidget {
  const ForgetPasswordEmailPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordEmailPage> createState() =>
      _ForgetPasswordEmailPageState();
}

class _ForgetPasswordEmailPageState extends State<ForgetPasswordEmailPage> {
  final ForgetPasswordEmailController _controller =
      Get.put(ForgetPasswordEmailController());

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: Styles.blackTextStyle,
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: AppColors.a10,
                enabledBorder: const UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  borderSide: BorderSide(
                    color: AppColors.grey2,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.p50,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _controller.sendPasswordResetEmail(_emailController.text);
              },
              child: SizedBox(
                width: 250,
                height: 42,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: ShapeDecoration(
                          color: AppColors.p40,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.50,
                              color: AppColors.p40,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: AppColors.p10,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Text(
                          'Send Password Reset Email',
                          style: Styles.whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: AppFontWeight.medium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
