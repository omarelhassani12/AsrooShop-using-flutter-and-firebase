import 'package:asrooshop/logic/controllers/product_controller.dart';
import 'package:asrooshop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoriteList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Please, Add your favorites products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return buildFavItems(
                image: controller.favoriteList[index].image,
                price: controller.favoriteList[index].price,
                title: controller.favoriteList[index].title,
                productId: controller.favoriteList[index].id,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.favoriteList.length,
          );
        }
      }),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFavorites(productId);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
