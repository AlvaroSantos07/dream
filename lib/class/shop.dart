import "package:cloud_firestore/cloud_firestore.dart";
import "package:dream/services/firestore.dart";
import "package:flutter/material.dart";
import "product.dart";

class Shop extends ChangeNotifier {
  final List<Product> shopList = [
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


final List<Product> shopPc = [
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
  ];final List<Product> shopMon = [
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
  final List<Product> shopPeri = [
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

  List<Product> get shop => shopList;
  List<Product> get shopper => shopPeri;
  List<Product> get shopmon => shopMon;
  List<Product> get shoppc => shoppc;

  List<Product> get cart => _cart;

//adicionar produto ao carrinho
 //aumentar quantidade de produto no carrinho
  void incrementQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).incrementQuantity();
    notifyListeners();
  }

  //diminuir quantidade de produto no carrinho
  void decreamentQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).decreamentQuantity();
    notifyListeners();
  }

  //zerar quantidade do produto no carrinho
  void initialQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).initialQuantity();
    notifyListeners();
  }

//adicionar produto ao carrinho
  void addToCart(Product item) {
    if (_cart.contains(item)) {
      incrementQuantity(item);
      notifyListeners();
    } else {
      _cart.add(item);
      incrementQuantity(item);
      notifyListeners();
    }
  }

  void removeFromCart(Product item) {
    initialQuantity(item);
    _cart.remove(item);
    notifyListeners();
  }

  void decreamentFromCart(Product item) {
    decreamentQuantity(item);
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
