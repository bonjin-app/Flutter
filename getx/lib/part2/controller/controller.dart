import 'package:get/get.dart';
import '../data/services.dart';
import '../model/product_model.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading.value = true;
    var products = await Services.fetchProducts();
    Future.delayed(Duration(milliseconds: 300));
    isLoading.value = false;

    if(products != null) {
      productList.value = products;
    }
  }
}