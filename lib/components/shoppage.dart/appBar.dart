import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../colors/light_mode.dart';
import '../../colors/providerTheme.dart';
import 'carrosel.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>().themeData;
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
                LogoAndSearch(context, theme),
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

LogoAndSearch(BuildContext context, ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0, top: 26),
            child: _trocaTema(context, theme)
          )
        ],
      ),
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 28, right: 20),
            child: Image(
              image: AssetImage("assets/logo.png"),
              width: 70,
            ),
          ),
        ],
      ),
      
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


_trocaTema(BuildContext context, ThemeData theme){
  return Container(
          height: 40,
          margin: const EdgeInsets.only(left: 3, top: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Theme.of(context).colorScheme.secondary,
                  ])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
                icon: Icon(
                  theme == lightMode
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  color: Colors.white,
                ),
              ),
              Text(
                theme == lightMode ? "Tema Claro        " : "Tema Escuro      ",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255)),
              )
            ],
          ));
}