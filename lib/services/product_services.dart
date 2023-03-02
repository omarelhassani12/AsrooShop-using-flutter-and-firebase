import 'package:asrooshop/model/product_models.dart';
import 'package:asrooshop/utils/my_string.dart';
import 'package:http/http.dart' as Http;

class ProductService {
  static Future<List<ProductModels>> getProduct() async {
    var response = await Http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to get product");
    }
  }
}
