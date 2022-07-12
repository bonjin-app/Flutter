import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (previousValue, element) => previousValue + element.price);
  int get count => cartItems.length;

  @override
  void onInit() {
    super.onInit();
  }

  void addToItem(Product product) {
    cartItems.add(product);
  }
}