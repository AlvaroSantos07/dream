import 'package:dream/components/tile/listDrawer.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool teste = true;

    return Drawer(
      
      backgroundColor: Color.fromARGB(174, 0, 0, 0),
      shape: BeveledRectangleBorder(side: BorderSide(color: const Color.fromARGB(255, 0, 0, 0))),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromARGB(255, 173, 170, 170), Colors.white]),
                 borderRadius: BorderRadius.circular(20)),
              currentAccountPicture: teste
                  ? Image(image: AssetImage("assets/logo.png"))
                  : Icon(
                      Icons.account_circle,
                      size: 80,
                      color: Color.fromARGB(255, 5, 15, 62),
                    ),
              accountName: Text(
               teste? "digital dream" : "Faça Login",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                teste? "Digitaldream@gmail.com": "usuarioConvidade@dream.com",
                  style: TextStyle(color: Colors.black))
                  
                ),

                //Lista do drawer

                ListDrawer(icon: Icon(Icons.shopping_cart_outlined), text: "carrinho", onTap:()=>Navigator.pushNamed(context, "/cartPage")),
        ],
      ),
    );
  }
}
