import "package:cloud_firestore/cloud_firestore.dart";
import "package:dream/services/firestore.dart";
import "package:flutter/material.dart";
import "product.dart";

class Shop extends ChangeNotifier {
  final List<Product> shopList = [
    Product(
        name: "Athenas",
        price: 599.99,
        description: "PC Básico",
        rating: 4.2,
        imagePath: "assets/pc.png"),
    Product(
        name: "Ares",
        price: 1199.99,
        description: "Pc gamer potente",
        imagePath: "assets/ares.png"),
    Product(
        name: "Hera",
        price: 999.99,
        description: "PC Gamer com WaterCooler",
        imagePath: "assets/hera.png"),
    Product(
        name: "Apolo",
        price: 819.99,
        description: "Custo beneficio",
        imagePath: "assets/apoloo.png"),
  ];


final List<Product> shopPc = [
    Product(
        name: "Athenas",
        price: 599.99,
        description: "PC Básico",
        rating: 4.2,
        imagePath: "assets/pc.png"),
    Product(
        name: "Ares",
        price: 1199.99,
        description: "PC Gamer potente",
        rating: 4.2,
        imagePath: "assets/ares.png"),
    Product(
        name: "Hera",
        price: 999.99,
        description: "PC Gamer com WaterCooler",
        imagePath: "assets/hera.png"),
    Product(
        name: "Apolo",
        price: 819.99,
        description: "Custo beneficio",
        imagePath: "assets/apoloo.png"),
    ];
    final List<Product> shopMon = [
    Product(
        name: "Monitor Pandora",
        price: 799.99,
        description: "Monitor Ultra Wide",
        rating: 5.0,
        imagePath: "assets/monitor1.png"),
    Product(
        name: "Monitor Pandora",
        price: 799.99,
        description: "Monitor Ultra Wide",
        rating: 5.0,
        imagePath: "assets/monitor1.png"),
  ];
  final List<Product> shopPeri = [
    Product(
        name: "Logitech",
        price: 118.80,
        description: "Headset de alta\n     qualidade",
        rating: 4.2,
        imagePath: "assets/fone.png"),   
    Product(
        name: "Logitech",
        price: 118.80,
        description: "Headset de alta\n     qualidade",
        rating: 4.2,
        imagePath: "assets/fone.png"),   
    Product(
        name: "Logitech",
        price: 118.80,
        description: "Headset de alta\n     qualidade",
        rating: 4.2,
        imagePath: "assets/mouse.png"),   
    Product(
        name: "Logitech",
        price: 118.80,
        description: "Headset de alta\n     qualidade",
        rating: 4.2,
        imagePath: "assets/mouse.png"),   
    Product(
        name: "Logitech",
        price: 118.80,
        description: "Headset de alta\n     qualidade",
        rating: 4.2,
        imagePath: "assets/mouse.png"),  
  ];
  List<Product> _cart = [];

  List<Product> get shop => shopList;
  List<Product> get shopper => shopPeri;
  List<Product> get shopmon => shopMon;
  List<Product> get shoppc => shopPc;

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
