import 'package:dream/components/tile/myShopTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../class/shop.dart';
import '../tile/myProductTile.dart';

class MyListViewShop extends StatelessWidget {
  const MyListViewShop({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shoppc;
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: ListView(children: [
      SizedBox(
        height: 340,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 2, bottom: 5),
          itemBuilder: (context, index) {
            final product = products[index];
            return MyShopTile(product: product);
          },
        ),
      ),
    ]));
  }
}
