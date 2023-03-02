import 'package:asrooshop/utils/theme.dart';
import 'package:asrooshop/view/widgets/home/card_items.dart';
import 'package:asrooshop/view/widgets/home/search_text_form.dart';
import 'package:asrooshop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      text: "Find Your",
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      text: "INSPIRATION",
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(height: 20),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  text: "Categories",
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
