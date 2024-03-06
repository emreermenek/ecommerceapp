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
}
