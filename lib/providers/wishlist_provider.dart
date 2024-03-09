import 'package:ecommerce_app_en/models/wishlist_model.dart';
import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/card_model.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishlistItems = {};
  Map<String, WishlistModel> get getWishlistItems {
    return _wishlistItems;
  }

  void addAndRemoveFromWishlist({required String productId}) {
    if (_wishlistItems.containsKey(productId)) {
      _wishlistItems.remove(productId);
    } else {
      _wishlistItems.putIfAbsent(
          productId,
          () => WishlistModel(
              wishlistID: const Uuid().v4(), productId: productId));
    }

    notifyListeners();
  }

  bool isProductInWishlist({required String productId}) {
    return _wishlistItems.containsKey(productId);
  }

  void clearLocalWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}
