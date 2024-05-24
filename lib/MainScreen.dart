/*import 'package:dream/components/homepage/ShopPage.dart';
import 'package:dream/pages/cartPage.dart';
import 'package:dream/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'pages/buildPage.dart';

class MyMainScreen extends StatefulWidget {
  const MyMainScreen({Key? key}) : super(key: key);

  @override
  State<MyMainScreen> createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    homePage(),
    ShopPage(),
    BuildPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            title: Text("Shop"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.computer_outlined),
            title: Text("Build"),
            selectedColor: Colors.deepPurple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
            selectedColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

*/
