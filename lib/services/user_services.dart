import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/models/products.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');

  // Add to favorites
  Future<void> addToFavorites(String productId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await userCollection.doc(user.uid).update({
        'saved': FieldValue.arrayUnion([productId])
      });
    }
  }

  // Remove from favorites
  Future<void> removeFromFavorites(String productId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await userCollection.doc(user.uid).update({
        'saved': FieldValue.arrayRemove([productId])
      });
    }
  }

  // Add to cart
  Future<void> addToCart(Product product) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await userCollection.doc(user.uid).update({
        'cart': FieldValue.arrayUnion([product.toFirestore()])
      });
    }
  }

  // Remove from cart
  Future<void> removeFromCart(Product product) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await userCollection.doc(user.uid).update({
        'cart': FieldValue.arrayRemove([product.toFirestore()])
      });
    }
  }

  // Fetch user favorites
  Future<List<String>> fetchFavorites() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await userCollection.doc(user.uid).get();
      List<String> favorites = List<String>.from(doc['saved']);
      return favorites;
    }
    return [];
  }

  // Fetch user cart
  Future<List<Product>> fetchCart() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await userCollection.doc(user.uid).get();
      List<dynamic> cart = doc['cart'];
      return cart.map((item) => Product.fromFirestoreForCart(item)).toList();
    }
    return [];
  }

  // check if the product if is present in the favourites collection  
  Future<bool> isExistInFavorite(String id) async {
    User? user = _auth.currentUser;
    if(user != null){
      DocumentSnapshot doc  = await userCollection.doc(user.uid).get();
      List<String> favorites = List<String>.from(doc['saved']);
      return favorites.contains(id);
    }
    return false;
  }

  // add the user info to firestore
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async{
    return await FirebaseFirestore.instance.collection("User").doc(id).set(userInfoMap);
  }

  // update user info in firestore
  Future updateProfile(String id, Map<String, dynamic> updateInfo) async {
    return await userCollection.doc(id).update(updateInfo);
  }
}