import 'package:flutter/material.dart';
import 'package:project1/models/products.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  // add to cart
  void toggleProduct(Product product) {
    if(_cart.contains(product)){
      for(Product item in _cart){
        item.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  } 

  // get total price of all items in the cart
  getTotalPrice() {
    double total = 0;
    for(Product item in _cart){
      total += item.price * item.quantity;
    }
    return total;
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) => _cart[index].quantity--;

  static CartProvider of(
    BuildContext context, {
      bool listen = true,
    }
  ) {
    return Provider.of<CartProvider>(
      context,
      listen: listen
    );
  }
}