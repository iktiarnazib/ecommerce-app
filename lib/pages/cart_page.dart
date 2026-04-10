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
    void onRemove(
      BuildContext context,
      Product cartProducts,
      String name,
      List cartProduct,
    ) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Do you want to remove $name from the cart?'),

            actions: [
              //no
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('NO'),
              ),
              //yes
              MaterialButton(
                onPressed: () {
                  if (cartProduct.contains(cartProducts)) {
                    ref.read(cartProvider.notifier).removeProduct(cartProducts);
                  }
                  Navigator.pop(context);
                },
                child: Text('YES'),
              ),
            ],
          );
        },
      );
    }

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
                    Row(
                      children: [
                        Text(
                          cartProducts[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$${cartProducts[index].price}'),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        onRemove(
                          context,
                          cartProducts[index],
                          cartProducts[index].name,
                          cartProducts,
                        );
                      },
                      icon: Icon(Icons.remove),
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
