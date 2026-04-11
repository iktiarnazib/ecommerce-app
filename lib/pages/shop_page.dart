import 'package:ecommerceapp/components/my_drawer.dart';
import 'package:ecommerceapp/components/product_tile.dart';
import 'package:ecommerceapp/pages/cart_page.dart';
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
    final allProducts = ref.read(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('GYMSHARK'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'cartPage');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          //subtitle
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
            child: FittedBox(
              child: Center(
                child: Text(
                  'Train with purpose. Live with discipline.',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 610,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allProducts.length,
              padding: EdgeInsets.all(15),
              itemBuilder: (BuildContext context, int index) {
                return ProductTile(product: allProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
