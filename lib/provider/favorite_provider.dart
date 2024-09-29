import 'package:flutter/material.dart';
import '../models/model.dart';

class FavoriteProvider with ChangeNotifier {
  final List<AllProduts> _favoriteProducts = [];

  List<AllProduts> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(AllProduts product) {
    if (_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(AllProduts product) {
    return _favoriteProducts.contains(product);
  }
}
