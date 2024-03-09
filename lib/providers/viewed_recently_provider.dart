import 'package:ecommerce_app_en/models/wishlist_model.dart';
import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/card_model.dart';
import '../models/viewed_recently_model.dart';

class ViewedRecentlyProvider with ChangeNotifier {
  final Map<String, ViewedRecentlyModel> _lastViewedItems = {};
  Map<String, ViewedRecentlyModel> get getLastViewedItems {
    return _lastViewedItems;
  }

  bool isProductInLastViewedList({required String productId}) {
    return _lastViewedItems.containsKey(productId);
  }

  void addToLastViewed({required String productId}) {
    _lastViewedItems.putIfAbsent(
        productId,
        () => ViewedRecentlyModel(
            lastViwedId: const Uuid().v4(), productId: productId));
    notifyListeners();
  }

  void clearLocalLastViewedList() {
    _lastViewedItems.clear();
    notifyListeners();
  }
}
