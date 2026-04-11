import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Page',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          cartProducts[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$${cartProducts[index].price}'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
