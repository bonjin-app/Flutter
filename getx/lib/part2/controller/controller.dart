import 'package:get/get.dart';
import '../data/services.dart';
import '../model/product_model.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;

  void fetchData() async {
    var products = await Services.fetchProducts();
    if(products != null) {
      productList.value = products;
    }
  }
}