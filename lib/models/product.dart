import 'package:flutter/material.dart';

final class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    // required this.imagePath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
