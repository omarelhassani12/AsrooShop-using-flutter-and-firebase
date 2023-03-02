import 'package:asrooshop/utils/theme.dart';
import 'package:asrooshop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  ContainerUnder(
      {required this.text,
      required this.textType,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            text: text,
            underLine: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              text: textType,
              underLine: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
