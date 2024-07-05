import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../class/product.dart';
import '../../class/shop.dart';
import '../buttons/iconButton.dart';

class MyMonitorTile extends StatelessWidget {
  final Product product;
  const MyMonitorTile({super.key, required this.product});

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
        height: 80,
        width: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [_led(Theme.of(context).colorScheme.secondary)],
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 160,
                  child: Row(
                    children: [Image.asset(product.imagePath)],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 48.0),
                  child: Text("      ${product.name}", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 2,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.secondary
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: 
                    Text(product.description, style: TextStyle(
                      color: Theme.of(context).colorScheme.outline
                    ),)
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text("Preço \n${product.price}".toString()),
                      )
                  ],)
                  ]
                  
                ),

                Column(
                  children: [
                    GestureDetector(
                      onTap: () => addCart(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.shopping_cart),
                          )),
                      )
                    ),
                  ],
                )
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
      color: colors.withOpacity(0.8),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3));
}
