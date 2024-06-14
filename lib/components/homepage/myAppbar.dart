import 'package:dream/colors/providerTheme.dart';
import "package:dream/colors/light_mode.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>().themeData;
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            /*Theme.of(context).colorScheme.inversePrimary,
            Theme.of(context).colorScheme.onInverseSurface
           */
          Colors.transparent,
          Colors.transparent
          ]),
          boxShadow: [
            BoxShadow(
      color: //Theme.of(context).colorScheme.inversePrimary,
      Colors.transparent,
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3))
          ]
         ),

      child: Column(
        children: [
          SizedBox(height: 20),
          _profileAndICon(context, theme),
          SizedBox(height: 0),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                children: [
                  Text(
                    "Hello User!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  Text("lorem ipsum dolor lorem",
                  style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black)
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}

_profileAndICon(BuildContext context, theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          height: 40,
          margin: const EdgeInsets.only(left: 3, top: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.onPrimary
            ])
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
                icon: Icon(
                  theme == lightMode? Icons.light_mode_outlined: Icons.dark_mode_outlined,
                  color: Colors.white,
                ),
              ),
              Text(
                theme == lightMode? "Tema Claro        ":"Tema Escuro      ",
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
              )
            ],
          )),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image(
          image: AssetImage(
            "assets/logo.png",
          ),
          height: 60,
        ),
      )
    ],
  );
}
