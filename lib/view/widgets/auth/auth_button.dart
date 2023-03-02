import 'package:asrooshop/utils/theme.dart';
import 'package:asrooshop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          text: text,
          underLine: TextDecoration.none),
    );
  }
}
