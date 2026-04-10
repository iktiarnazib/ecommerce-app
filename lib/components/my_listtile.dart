import 'package:flutter/material.dart';

class MyListtile extends StatelessWidget {
  final Function()? onTap;
  final IconData? icons;
  final String text;
  const MyListtile({
    super.key,
    required this.onTap,
    required this.icons,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icons,

          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(text),
      ),
    );
  }
}
