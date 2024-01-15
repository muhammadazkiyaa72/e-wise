import 'package:ewise/core/styles.dart';
import 'package:ewise/core/values/colors.dart';
import 'package:ewise/core/values/font_weight.dart';
import 'package:ewise/data/model/user_model.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:ewise/presentation/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/build_text_form_field.dart';
import 'components/build_button.dart';
// import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    final formKey = GlobalKey<FormState>();
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

              Form(
                key: formKey,
                child: Column(
                  children: [
                    // email text field
                    BuildTextFormField(
                      controller: controller.fullname,
                      labelText: "Full Name",
                    ),

                    const SizedBox(
                      height: 19,
                    ),
                    BuildTextFormField(
                      controller: controller.email,
                      labelText: "Email",
                    ),

                    const SizedBox(
                      height: 19,
                    ),
                    // password text field
                    BuildTextFormField(
                      controller: controller.password,
                      labelText: "Kata Sandi",
                      isPassword: true,
                    ),

                    const SizedBox(
                      height: 19,
                    ),

                    // password confirmation textfield
                    BuildTextFormField(
                      controller: controller.confirmPassword,
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
              BuildButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.password.text ==
                        controller.confirmPassword.text) {
                      final user = UserModel(
                        fullName: controller.fullname.text.trim(),
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                      );
                      RegisterController.instance.createUser(user);
                    } else {
                      Get.snackbar('Failed', 'Register gagal!!');
                    }
                  }
                },
              ),

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
