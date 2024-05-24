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
            Colors.transparent,
            Colors.transparent
           
          ]),
          boxShadow: [
            BoxShadow(
      color: Colors.transparent,
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3))
          ]
         ),

      child: Column(
        children: [
          SizedBox(height: 20),
          _profileAndICon(context),
          SizedBox(height: 0),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                children: [
                  Text(
                    "Hello User!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600,
                    color: Colors.white),
                  ),
                  Text("lorem ipsum dolor lorem",
                  style: TextStyle(color: Colors.white),
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
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: Colors.deepPurple,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.deepPurple)
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}

_profileAndICon(BuildContext context) {
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
              Colors.deepPurple,
              Colors.black
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
                  Icons.account_circle_outlined,
                  color: Colors.white,
                ),
              ),
              Text(
                "Bem vindo User     ",
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
