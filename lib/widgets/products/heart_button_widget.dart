import 'package:ecommerce_app_en/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeartButtonWidget extends StatelessWidget {
  const HeartButtonWidget({
    super.key,
    required this.productId,
    this.isInWishlist = false,
    this.size,
  });

  final String productId;
  final bool? isInWishlist;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return InkWell(
        onTap: () {
          wishlistProvider.addAndRemoveFromWishlist(productId: productId);
        },
        child: Icon(
          wishlistProvider.isProductInWishlist(productId: productId)
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          color: wishlistProvider.isProductInWishlist(productId: productId)
              ? Colors.red
              : null,
          size: size,
        ));
  }
}
