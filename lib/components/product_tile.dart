import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductTile extends ConsumerStatefulWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  ConsumerState<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends ConsumerState<ProductTile> {
  @override
  Widget build(BuildContext context) {
    final cartProduct = ref.watch(cartProvider);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //product image
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            //product name
            Text(
              widget.product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            //product description
            Text(
              widget.product.description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            SizedBox(height: 30),
            //product price + add to cart button
            Row(
              children: [
                Text('\$${widget.product.price}'),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    ref.read(cartProvider.notifier).addProduct(widget.product);
                  },

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.surface,
                    ),

                    padding: EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {
                        if (!cartProduct.contains(widget.product)) {
                          ref
                              .read(cartProvider.notifier)
                              .addProduct(widget.product);
                        }
                      },
                      icon: Icon(Icons.add),
                      color: Colors.black,
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
