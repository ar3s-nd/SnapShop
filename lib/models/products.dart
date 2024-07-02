// Product class to store product details
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
   final String id;
   final String name, category, description, type;
   List<String> image;
   final double price;
   int quantity;

   Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,
    required this.type
   });

   // Factory method to create a Product from a Firestore document
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,  
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      image: List<String>.from(data['image'] ?? []), 
      description: data['description'] ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      quantity: data['quantity'] ?? 0,
      type: data['type'] ?? '',
    );
  }

  factory Product.fromFirestoreForCart(Map<String, dynamic> data) {
    return Product(
      id: data['id'] ?? '',  
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      image: List<String>.from(data['image'] ?? []), 
      description: data['description'] ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      quantity: data['quantity'] ?? 0,
      type: data['type'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'category': category,
      'image': image,
      'description': description,
      'price': price,
      'quantity': quantity,
      'type': type
    };
  }
}