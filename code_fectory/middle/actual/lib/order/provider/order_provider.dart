import 'package:actual/order/model/order_model.dart';
import 'package:actual/order/model/post_order_body.dart';
import 'package:actual/user/provider/basket_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../repository/order_repository.dart';

final orderProvider =
    StateNotifierProvider<OrderStateNotifier, List<OrderModel>>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderStateNotifier(ref: ref, repository: repository);
});

class OrderStateNotifier extends StateNotifier<List<OrderModel>> {
  final Ref ref;
  final OrderRepository repository;

  OrderStateNotifier({
    required this.ref,
    required this.repository,
  }) : super([]);

  Future<bool> postOrder() async {
    try {
      final id = const Uuid().v4();
      final state = ref.read(basketProvider);

      await repository.postOrder(
        body: PostOrderBody(
          id: id,
          products: state
              .map((e) =>
              PostOrderBodyProduct(productId: e.product.id, count: e.count))
              .toList(),
          totalPrice: state.fold(0, (p, e) => p + (e.count * e.product.price)),
          createdAt: DateTime.now().toString(),
        ),
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
