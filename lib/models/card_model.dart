import 'package:flutter/material.dart';

class CardModel with ChangeNotifier {
  final String cardId, productId;
  final int quantity;

  CardModel(
      {required this.cardId, required this.productId, required this.quantity});
}
