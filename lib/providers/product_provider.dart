//product for sale

import 'package:ecommerceapp/models/product.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

final List<Product> products = [
  //product 1;
  Product(
    id: 1,
    name: 'Product 1',
    price: 119.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    // imagePath: 'assets/images/602fighter.png',
  ),
  Product(
    id: 2,
    name: 'Product 2',
    price: 119.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    // imagePath: 'assets/images/602fighter.png',
  ),
  Product(
    id: 3,
    name: 'Product 3',
    price: 119.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    // imagePath: 'assets/images/602fighter.png',
  ),
  Product(
    id: 4,
    name: 'Product 4',
    price: 119.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    // imagePath: 'assets/images/602fighter.png',
  ),
  Product(
    id: 5,
    name: 'Product 5',
    price: 119.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    // imagePath: 'assets/images/602fighter.png',
  ),
];

@riverpod
List<Product> product(ref) {
  return products;
}
