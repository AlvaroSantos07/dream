import 'package:flutter/material.dart';

import 'carrosel.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Container principal
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                LogoAndSearch(),
                SizedBox(
                  height: 10, // Metade da altura do contêiner principal
                  child: Container(
                    
                  ), // Deixe este espaço vazio para o carrossel
                ),
              ],
            ),
          ),
          // Usando Transform para mover o carrossel para fora do contêiner principal
          Transform.translate(
            offset: Offset(0.0, -75.0), // Mova o carrossel para cima
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)
              ),
              height: 150, // Metade da altura do contêiner principal
              width: MediaQuery.of(context).size.width,
              child: Carrosel(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget LogoAndSearch() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Image(
              image: AssetImage("assets/logo.png"),
              width: 60,
            ),
          ),
        ],
      ),
      Column(
        children: [

        ],
      )
      /* Column(
        children: [
          SizedBox(
            child:
            Placeholder(
            )
              /*Expanded(
              child: 
              TextField(
                 decoration: 
                 InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                 )
              )
              )*/
            )
            ],
          ),*/
    ],
  );
}
