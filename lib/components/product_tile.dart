import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String description;
  final double price;
  const ProductTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Column(
        children: [
          Text(title),
          Text(description),
          Text('$price'),
          SizedBox(
            height: 20,
            width: 20,
            child: GestureDetector(onTap: onTap, child: Text('add to cart')),
          ),
        ],
      ),
    );
  }
}
