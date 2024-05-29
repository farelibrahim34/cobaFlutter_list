import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <String>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() {
    var productResults = [
      'Produk 1',
      'Produk 2',
      'Produk 3',
      'Produk 4',
      'Produk 5',
    ];
    products.assignAll(productResults);
  }
}
