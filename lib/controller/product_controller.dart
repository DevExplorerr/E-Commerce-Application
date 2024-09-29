import 'dart:convert';
import 'package:get/get.dart';
import '../models/model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  final allProducts = <AllProduts>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  final url = 'https://fakestoreapi.com/products';

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonData = json.decode(response.body);
        allProducts.value = List<AllProduts>.from(
            jsonData.map((item) => AllProduts.fromJson(item)));
      } else {
        throw Exception("Failed to load data");
      }
    } finally {
      isLoading(false);
    }
  }
}
