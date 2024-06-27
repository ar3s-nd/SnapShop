import 'package:flutter/material.dart';
import 'package:project1/models/products.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorites = [];
  List<Product> get favorites => _favorites;

  // add to saved items list
  void toggleFavorite(Product product) {
    if(_favorites.contains(product)){
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  } 

  // check if item is saved 
  bool isExist(Product product) {
    final isExist = _favorites.contains(product);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
      bool listen = true,
    }
  ) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen
    );
  }
}