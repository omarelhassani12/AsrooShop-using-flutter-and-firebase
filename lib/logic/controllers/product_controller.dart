import 'package:asrooshop/model/product_models.dart';
import 'package:asrooshop/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoriteList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = storage.read<List>("isFavoritesList");

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getproducts();
  }

  void getproducts() async {
    var products = await ProductService.getProduct();
    try {
      isLoading(true);

      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //logic for favorites Screen

  void manageFavorites(int productId) async {
    var existingIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoriteList.removeAt(existingIndex);
      await storage.remove("isFavoritesList");
    } else {
      favoriteList
          .add(productList.firstWhere((element) => element.id == productId));

      await storage.write("isFavoritesList", favoriteList);
    }
  }

  bool isFavorites(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }
}
