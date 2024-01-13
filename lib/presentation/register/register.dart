import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/build_text_form_field.dart';
import 'components/build_button.dart';
// import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 125.0),
          padding: const EdgeInsets.all(24),
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // text buat akun baru
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Buat Akun Baru",
                    style: Styles.primaryTextStyle.copyWith(
                        fontWeight: AppFontWeight.semiBold, fontSize: 16.0),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              const Form(
                child: Column(
                  children: [
                    // email text field
                    BuildTextFormField(
                      labelText: "Email",
                    ),

                    SizedBox(
                      height: 19,
                    ),

                    // password text field
                    BuildTextFormField(
                      labelText: "Kata Sandi",
                      isPassword: true,
                    ),

                    SizedBox(
                      height: 19,
                    ),

                    // password confirmation textfield
                    BuildTextFormField(
                      labelText: "Konfirmasi Kata Sandi",
                      isPassword: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // submit button
              const BuildButton(),

              const SizedBox(
                height: 10,
              ),

              // text sudah punya akun?
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(const LoginScreen());
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "sudah punya akun?",
                        style: Styles.primaryTextStyle.copyWith(
                            fontWeight: AppFontWeight.medium, fontSize: 14.0),
                        children: [
                          TextSpan(
                              text: " Masuk Sekarang",
                              style: Styles.primaryTextStyle.copyWith(
                                  fontWeight: AppFontWeight.bold,
                                  fontSize: 14.0))
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
