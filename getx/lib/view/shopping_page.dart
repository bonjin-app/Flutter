import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Add to cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Total amount',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'item',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
