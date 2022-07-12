import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  void fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    var productData = [
      Product(id: 1, productName: 'Mouse', productDescription: 'some description about product', price: 40),
      Product(id: 2, productName: 'Keyboard', productDescription: 'some description about product', price: 200),
      Product(id: 3, productName: 'Monitor', productDescription: 'some description about product', price: 50),
      Product(id: 4, productName: 'Ram', productDescription: 'some description about product', price: 37),
      Product(id: 5, productName: 'Speaker', productDescription: 'some description about product', price: 125),
    ];

    products.assignAll(productData);
  }
}