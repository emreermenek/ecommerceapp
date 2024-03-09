import 'package:flutter/material.dart';

class ViewedRecentlyModel with ChangeNotifier {
  final String productId, lastViwedId;

  ViewedRecentlyModel({required this.productId, required this.lastViwedId});
}
