import 'package:asrooshop/logic/controllers/main_controller.dart';
import 'package:asrooshop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/shop.png"),
            ),
          ],
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          title: Text(
            controller.title[controller.currentIndex.value],
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.category,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
