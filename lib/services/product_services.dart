import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/models/products.dart';

class ProductService {
  final CollectionReference productCollection = FirebaseFirestore.instance.collection('Product');

  // Fetch all products
  Future<List<Product>> fetchProducts() async {
    QuerySnapshot querySnapshot = await productCollection.get();
    return querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
  }

  // Fetch product by category
  Future<List<Product>> fetchProductsByType(String type) async {
    QuerySnapshot querySnapshot = await productCollection.where('type', isEqualTo: type).get();
    return querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
  }
}