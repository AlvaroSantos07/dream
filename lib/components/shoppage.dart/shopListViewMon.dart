import 'package:dream/components/tile/monitorTile.dart';
import 'package:dream/components/tile/myShopTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../class/shop.dart';
import '../tile/myProductTile.dart';

class MyListViewMon extends StatelessWidget {
  const MyListViewMon({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shopmon;
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: ListView(children: [
      SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 2, bottom: 5),
          itemBuilder: (context, index) {
            final product = products[index];
            return MyMonitorTile(product: product);
          },
        ),
      ),
    ]));
  }
}
