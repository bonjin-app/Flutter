import 'package:actual/product/model/product_model.dart';
import 'package:actual/user/model/basket_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

final basketProvider = StateNotifierProvider<BasketStateNotifier, List<BasketItemModel>>((ref) {
  return BasketStateNotifier();
});

class BasketStateNotifier extends StateNotifier<List<BasketItemModel>> {
  BasketStateNotifier() : super([]);

  Future<void> addToBasket({
    required ProductModel product,
  }) async {
    final exists =
        state.firstWhereOrNull((element) => element.product.id == product.id) !=
            null;

    if (exists) {
      state = state
          .map((e) =>
              e.product.id == product.id ? e.copyWith(count: e.count + 1) : e)
          .toList();
    } else {
      state = [
        ...state,
        BasketItemModel(product: product, count: 1),
      ];
    }
  }

  Future<void> removeFromBasket({
    required ProductModel product,
    bool isDelete = false,
  }) async {
    final exists =
        state.firstWhereOrNull((element) => element.product.id == product.id) !=
            null;

    if (!exists) {
      return;
    }

    final existingProduct =
        state.firstWhere((element) => element.product.id == product.id);

    if (existingProduct.count == 1 || isDelete) {
      state = state.where((element) => element.product.id != product.id).toList();
    } else {
      state = state.map((e) =>
              e.product.id == product.id ? e.copyWith(count: e.count - 1) : e)
          .toList();
    }
  }
}
