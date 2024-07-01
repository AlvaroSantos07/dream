import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../class/shop.dart';
import '../tile/myProductTile.dart';

class MyListViewPeri extends StatelessWidget {
  const MyListViewPeri({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shopper;
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: ListView(children: [
      Container(
        height: 400,
        width: 800,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            final product = products[index];
            return MyProductTile(product: product);
          },
        ),
      ),
    ]));
  }
}
