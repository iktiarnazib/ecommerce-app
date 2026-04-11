import 'package:ecommerceapp/components/my_button.dart';
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
          return AlertDialog.adaptive(
            title: Text('Remove from cart?'),
            content: Text('Do you want to remove $name from the cart?'),
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

    void payNowPressed() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Text('User Pressed Pay Now'),
            content: Text(
              'User pressed the Pay Now button, use stripe to connect payment gateway.',
            ),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: cartProducts.isEmpty
                  ? Center(child: Text('Your cart is empty..'))
                  : ListView.builder(
                      itemCount: cartProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Image.asset(
                                    cartProducts[index].imagePath,
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartProducts[index].name),
                                    Text('\$${cartProducts[index].price}'),
                                  ],
                                ),
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
            Padding(
              padding: EdgeInsets.all(20),
              child: MyButton(
                onTap: () {
                  payNowPressed();
                },
                child: Text('PAY NOW'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//cart page functional.