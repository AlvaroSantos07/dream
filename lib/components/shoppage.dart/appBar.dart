import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          LogoAndSearch(),
        ],
      ),
    );
  }
}


LogoAndSearch() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(padding: EdgeInsets.only(top: 40, left: 20),
      child: Image(image: AssetImage("assets/logo.png"), width: 60,),
      ),
    
    ],
  );
}