import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../class/product.dart';
import '../../class/shop.dart';
import '../buttons/iconButton.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  void addCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Deseja adicionar o Item Atual ao carrinho?"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                MaterialButton(
                    child: Text("Confirmar"),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<Shop>().addToCart(product);
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
              Theme.of(context).colorScheme.onInverseSurface,
              Theme.of(context).colorScheme.onInverseSurface,
              Theme.of(context).colorScheme.onInverseSurface,
              Theme.of(context).colorScheme.onInverseSurface,
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
            ]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [_led(Theme.of(context).colorScheme.secondary)]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(image: AssetImage(product.imagePath), width: 220),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${product.name}",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 160,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(product.description, style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),),
                              Row(children: [
                                Text(
                                  "R\$ ",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary,)
                                ),
                                Text(
                                  product.price.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.onTertiary, fontWeight: FontWeight.bold),
                                )
                              ]),
                              SizedBox(height: 25,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                  Column(
                        children: [
                          SizedBox(height: 50,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                               _led(Color.fromARGB(255, 202, 202, 202))
                              ]
                            ),
                              child: IconButton(onPressed: ()=>addCart(context), icon: Icon(Icons.add, color: Colors.black,)),
                            )
                        ],
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

_led(Color colors) {
  return BoxShadow(
      color: colors.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3));
}
