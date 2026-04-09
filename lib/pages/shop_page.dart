import 'package:ecommerceapp/components/my_drawer.dart';
import 'package:ecommerceapp/components/product_tile.dart';
import 'package:ecommerceapp/providers/cart_provider.dart';
import 'package:ecommerceapp/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});

  @override
  ConsumerState<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final allProducts = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Page '),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      body: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductTile(
              onTap: () {
                ref.read(cartProvider.notifier).addProduct(allProducts[index]);
              },
              title: allProducts[index].name,
              description: allProducts[index].description,
              price: allProducts[index].price,
            );
          },
        ),
      ),
    );
  }
}
