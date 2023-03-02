import 'package:asrooshop/logic/controllers/auth_controller.dart';
import 'package:asrooshop/routes/routes.dart';
import 'package:asrooshop/utils/my_string.dart';
import 'package:asrooshop/utils/theme.dart';
import 'package:asrooshop/view/widgets/auth/auth_button.dart';
import 'package:asrooshop/view/widgets/auth/auth_text_from_field.dart';
import 'package:asrooshop/view/widgets/auth/check_widget.dart';
import 'package:asrooshop/view/widgets/auth/container_under.dart';
import 'package:asrooshop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final fromkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.39,
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
                              text: "SIGN",
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
                              text: "UP",
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFromField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              //if value != validationName
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                )
                              : Image.asset('assets/images/user.png'),
                          suffixIcon: const Text(""),
                          hintText: 'User Name',
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar(
                                  "Check Box",
                                  "Please, Accept terms & conditions",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              } else if (fromkey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                //trim() is for remove the space in left or right if it exists
                                controller.signUpUsingFirebase(
                                  name: name,
                                  email: email,
                                  password: password,
                                );
                                controller.isCheckBox = true;
                              }
                            },
                            text: "SIGN UP",
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ContainerUnder(
                text: "Already have an account?",
                textType: "Log in",
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
