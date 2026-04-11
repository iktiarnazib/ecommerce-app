import 'package:ecommerceapp/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroPage extends ConsumerStatefulWidget {
  const IntroPage({super.key});

  @override
  ConsumerState<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends ConsumerState<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.trolley, size: 100, color: Colors.grey.shade900),
            SizedBox(height: 15),
            //title
            FittedBox(
              child: Text(
                'FunZ Shop',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 5),
            //subtitle
            FittedBox(
              child: Text(
                'Be Great, Do Great',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 30),
            //enter button
            MyButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'shopPage');
              },
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
