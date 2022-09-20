import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_card.dart';
import 'package:actual/user/provider/basket_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasketScreen extends ConsumerWidget {
  static String get routeName => 'basket';

  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basket = ref.watch(basketProvider);

    if (basket.isEmpty) {
      return DefaultLayout(
        title: '장바구니',
        child: Center(child: Text('장바구니가 비어있습니다.', textAlign: TextAlign.center,)),
      );
    }

    final productsTotal = basket.fold<int>(
      0,
      (previousValue, element) =>
          previousValue + (element.product.price * element.count),
    );

    final deliveryFee = basket.first.product.restaurant.deliveryFee;

    return DefaultLayout(
      title: '장바구니',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final model = basket[index];
                  return ProductCard.fromProductModel(
                    model: model.product,
                    onAdd: () {
                      ref
                          .read(basketProvider.notifier)
                          .addToBasket(product: model.product);
                    },
                    onSubtract: () {
                      ref
                          .read(basketProvider.notifier)
                          .removeFromBasket(product: model.product);
                    },
                  );
                },
                itemCount: basket.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 32,
                  );
                },
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '장바구니 금액',
                      style: TextStyle(
                        color: BODY_TEXT_COLOR,
                      ),
                    ),
                    Text('₩ $productsTotal')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '배달비',
                      style: TextStyle(
                        color: BODY_TEXT_COLOR,
                      ),
                    ),
                    if (basket.isNotEmpty)
                      Text(
                        '₩ $deliveryFee',
                      )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '총액',
                      style: TextStyle(
                        color: BODY_TEXT_COLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '₩ ${deliveryFee + productsTotal}',
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR,
                    ),
                    child: Text(
                      '결제하기',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
