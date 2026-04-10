//product for sale

import 'package:ecommerceapp/models/product.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

final List<Product> products = [
  //product 1;
  Product(
    id: 1,
    name: 'CHARGET-SHIRT',
    price: 36.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    imagePath: 'assets/images/ArrivalOversizedTShirt.jpg',
  ),
  Product(
    id: 2,
    name: 'Conditioning Club White',
    price: 34.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    imagePath: 'assets/images/AtlasT-Shirt.jpg',
  ),
  Product(
    id: 3,
    name: 'Atlas T-Shirt',
    price: 39.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    imagePath: 'assets/images/CHARGET-SHIRT.jpg',
  ),
  Product(
    id: 4,
    name: 'Conditioning Club Washed T-Shirt',
    price: 39.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    imagePath: 'assets/images/ConditioningClubWashedT-Shirt.jpg',
  ),
  Product(
    id: 5,
    name: 'Train T-Shirt',
    price: 27.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    imagePath: 'assets/images/ElementBaselayerT-Shirt.jpg',
  ),
  Product(
    id: 6,
    name: 'Element Baselayer T-Shirt',
    price: 27.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    imagePath: 'assets/images/RibbedTank1PK.jpg',
  ),
  Product(
    id: 7,
    name: 'Arrival Oversized T-Shirt',
    price: 25.99,
    description:
        'Valoce 602 Fighter is made from Alluminium and is one of the best bicycles to exist',
    imagePath: 'assets/images/TrainT-Shirt.jpg',
  ),
];

@riverpod
List<Product> product(ref) {
  return products;
}
