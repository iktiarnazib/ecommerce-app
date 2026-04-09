import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    state = {...state, product};
    debugPrint('Cart Size ${state.length}');
  }

  void removeProduct(Product product) {
    state = state.where((e) => e.id != product.id).toSet();
    debugPrint('Cart Size ${state.length}');
  }
}
