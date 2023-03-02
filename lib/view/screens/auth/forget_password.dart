import 'package:asrooshop/logic/controllers/auth_controller.dart';
import 'package:asrooshop/utils/my_string.dart';
import 'package:asrooshop/utils/theme.dart';
import 'package:asrooshop/view/widgets/auth/auth_button.dart';
import 'package:asrooshop/view/widgets/auth/auth_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,

        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Get.back();
                  //     },
                  //     icon: Icon(
                  //       Icons.close_rounded,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "If you want to recover your account, then please provide your email ID below.. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/forgetpass copy.png",
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFromField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        //if value != validationName
                        return 'Enter valid email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          )
                        : Image.asset('assets/images/email.png'),
                    suffixIcon: const Text(""),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      text: "SEND",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          controller.resetPassword(email);
                        }
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
