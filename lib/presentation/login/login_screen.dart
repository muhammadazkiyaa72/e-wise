import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/forget_password_otp/forget_password_email_page.dart';
import 'package:ewise/presentation/login/login_controller.dart';
import 'package:ewise/presentation/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.only(top: 23.57),
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/logo_new.png',
                      width: 320,
                      height: 320,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Masuk",
                    style: Styles.secondaryTextStyle.copyWith(
                      decoration: TextDecoration.none,
                      fontWeight: AppFontWeight.medium,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
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
                    const SizedBox(
                      height: 19,
                    ),
                    Obx(() => TextFormField(
                          obscureText: !controller.showPassword.value,
                          controller: controller.password,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi',
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
                            suffixIcon: IconButton(
                              icon: controller.showPassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () => controller.showPassword.toggle(),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const ForgetPasswordEmailPage());
                },
                child: Text(
                  'Lupa kata sandi?',
                  style: Styles.primaryTextStyle.copyWith(
                    fontWeight: AppFontWeight.medium,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  controller.login();
                },
                child: SizedBox(
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
                            'Masuk',
                            style: Styles.whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: AppFontWeight.medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Atau masuk dengan',
                      style: Styles.blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.loginUserWithGoogle();
                      },
                      child: SizedBox(
                        width: 192,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/img/img-google.png',
                                      width: 16,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      'Masuk',
                                      style: Styles.whiteTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: AppFontWeight.medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const RegisterScreen());
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'belum punya akun?',
                              style: Styles.primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: AppFontWeight.medium,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' buat akun',
                                  style: Styles.primaryTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: AppFontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
