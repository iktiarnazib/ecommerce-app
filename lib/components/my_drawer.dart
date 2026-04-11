import 'package:ecommerceapp/components/my_listtile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          SizedBox(height: 30),
          DrawerHeader(
            curve: Curves.bounceIn,
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: Icon(
                Icons.sports_gymnastics,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          SizedBox(height: 10),
          //text
          Text(
            'GYMSHARK',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(height: 30),
          //Home Tile
          MyListtile(
            onTap: () {
              Navigator.pop(context);
            },
            icons: Icons.home,
            text: 'Home',
          ),
          //cart tile
          MyListtile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'cartPage');
            },
            icons: Icons.shopping_bag,
            text: 'Cart',
          ),
          Expanded(child: SizedBox()),
          //exit
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: MyListtile(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'introPage',
                  (route) => false,
                );
              },
              icons: Icons.exit_to_app,
              text: 'Exit',
            ),
          ),
        ],
      ),
    );
  }
}
