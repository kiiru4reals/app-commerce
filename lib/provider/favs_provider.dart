import 'package:flutter/material.dart';
import 'package:shop/models/fav_attr.dart';

class FavsProvider with ChangeNotifier {
  Map<String, FavAttr> _favsItems = {};

  Map<String, FavAttr> get getFavsItems {
    return _favsItems;
  }

  void addAndRemoveFromFav(
      String productId, double price, String title, String imageUrl) {
    if (_favsItems.containsKey(productId)) {
      removeItem(productId);
    } else {
      _favsItems.putIfAbsent(
          productId,
              () => FavAttr(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }
  void removeItem(
      String productId,
      ) {
    _favsItems.remove(productId);
    notifyListeners();
  }

  void clearFavs() {
    _favsItems.clear();
    notifyListeners();
  }
}
