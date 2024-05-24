import "package:cloud_firestore/cloud_firestore.dart";
import "package:dream/services/firestore.dart";
import "package:flutter/material.dart";
import "product.dart";

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: "Athenas",
        price: 99.99,
        description: "PC Básico",
        rating: 4.2,
        imagePath: "assets/pc.png"),
    Product(
        name: "PC",
        price: 99.99,
        description: "PC basico",
        imagePath: "assets/pc.png"),
    Product(
        name: "PC",
        price: 99.99,
        description: "PC basico",
        imagePath: "assets/pc.png"),
    Product(
        name: "PC",
        price: 99.99,
        description: "PC basico",
        imagePath: "assets/pc.png"),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

//adicionar produto ao carrinho
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

/*  Shop() {
    _startProductsStream();
  }*/

/*  void _startProductsStream() {
    FirestoreServices().getProductsStream().listen((QuerySnapshot snapshot) {
      _shop.clear();
      for (var data in snapshot.docs) {
        _shop.add(Product(
            name: data["name"],
            price: data["price"],
            description: data["description"],
            imagePath: data["imagepath"]));
      }
    });
    notifyListeners();
  }*/
}
