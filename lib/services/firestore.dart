import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices{
final CollectionReference product = FirebaseFirestore.instance.collection("produtos");

Stream<QuerySnapshot> getProductsStream() {
  final productsStream = product.orderBy("name").snapshots();
  return productsStream;
}

}