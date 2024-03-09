import 'package:flutter/material.dart';

class WishlistModel with ChangeNotifier {
  final String productId, wishlistID;

  WishlistModel({required this.productId, required this.wishlistID});
}
