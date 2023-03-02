import 'package:asrooshop/logic/controllers/auth_controller.dart';
import 'package:asrooshop/routes/routes.dart';
import 'package:asrooshop/utils/my_string.dart';
import 'package:asrooshop/utils/theme.dart';
import 'package:asrooshop/view/widgets/auth/auth_button.dart';
import 'package:asrooshop/view/widgets/auth/auth_text_from_field.dart';
import 'package:asrooshop/view/widgets/auth/container_under.dart';
import 'package:asrooshop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final fromkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        // backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.399,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromkey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              fontSize: 28,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontWeight: FontWeight.w500,
                              text: "LOG",
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              fontSize: 28,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              text: "IN",
                              underLine: TextDecoration.none,
                            ),
                          ],
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
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  //if value != validationName
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    )
                                  : Image.asset('assets/images/lock.png'),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visiblity();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              hintText: 'Password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetPasswordScreen);
                            },
                            child: TextUtils(
                              fontSize: 14,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.normal,
                              text: "Forget Password?",
                              underLine: TextDecoration.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (fromkey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.loginInUsingFirebase(
                                    email: email, password: password);
                              }
                            },
                            text: "LOG IN",
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                          fontSize: 18,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                          text: "OR",
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSignUpApp();
                                },
                                child: Image.asset("assets/images/google.png"),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ContainerUnder(
                text: "Don't have an account?",
                textType: "Sign up",
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
