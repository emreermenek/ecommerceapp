import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/card_model.dart';

class CardProvider with ChangeNotifier {
  final Map<String, CardModel> _cardItems = {};
  Map<String, CardModel> get getCardItems {
    return _cardItems;
  }

  void addToCard({required String productId}) {
    _cardItems.putIfAbsent(
        productId,
        () => CardModel(
            cardId: const Uuid().v4(), productId: productId, quantity: 1));
    notifyListeners();
  }

  bool isProductInCardd({required String productId}) {
    return _cardItems.containsKey(productId);
  }

  double totalPrice({required ProductProvider productProvider}) {
    double total = 0;

    _cardItems.forEach((key, value) {
      final getCurProduct = productProvider.findByProductId(value.productId);
      if (getCurProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCurProduct.productPrice) * value.quantity;
      }
    });
    return double.parse(total.toStringAsFixed(3));
  }

  int totalQuantity() {
    int total = 0;
    _cardItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  void changeQuantity({required String productId, required int qty}) {
    _cardItems.update(
        productId,
        (cardItem) => CardModel(
            cardId: cardItem.cardId, productId: productId, quantity: qty));
    notifyListeners();
  }

  void clearLocalCard() {
    _cardItems.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _cardItems.remove(productId);
    notifyListeners();
  }
}
