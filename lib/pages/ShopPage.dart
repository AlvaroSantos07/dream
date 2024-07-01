import 'package:dream/components/shoppage.dart/appBar.dart';
import 'package:dream/components/shoppage.dart/productBlock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mdi_icons/flutter_mdi_icons.dart';

import '../components/shoppage.dart/categories.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Container(
          child: SingleChildScrollView(
            
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ShopAppBar(),
                ),
                Transform.translate(
                    offset: Offset(0.0, -35.0), child:
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _categories(context),
                    )
                    ),
                    Productblock()
              ],
            ),
          ),
        ));
  }
}

_categories(BuildContext context) {
  return Row(
    children: [
      Row(
        children: [
           itemMenu(
              context: context,
              icon: Mdi.rocket,
              name: "Computador",
              isFirst: false),
          itemMenu(
              context: context,
              icon: Mdi.monitor,
              name: "Monitores",
              isFirst: true),
          itemMenu(
              context: context,
              icon: Mdi.mouse,
              name: "Periféricos",
              isFirst: true),
          itemMenu(
              context: context,
              icon: Mdi.headset,
              name: "Headphones",
              isFirst: true),
        ],
      )
    ],
  );
}
