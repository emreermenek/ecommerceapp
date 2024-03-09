import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/models/product_model.dart';
import 'package:ecommerce_app_en/pages/inner_pages/products_details_page.dart';
import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:ecommerce_app_en/widgets/products/heart_button_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/card_provider.dart';
import '../../providers/viewed_recently_provider.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    final productModel = Provider.of<ProductModel>(context);
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height * 0.40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetails.rootName,
                        arguments: productModel.productId);
                    viewedRecentlyProvider.addToLastViewed(
                        productId: productModel.productId);
                  },
                  child: FancyShimmerImage(
                    imageUrl: productModel.productImage,
                    height: double.infinity,
                    width: size.width * 0.3,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SubtitleTextWidget(
                    label: productModel.productTitle,
                    maxLines: 2,
                    fontSize: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeartButtonWidget(productId: productModel.productId),
                      IconButton(
                          onPressed: () {
                            if (cardProvider.isProductInCardd(
                                productId: productModel.productId)) {
                              return;
                            }
                            cardProvider.addToCard(
                                productId: productModel.productId);
                          },
                          icon: Icon(
                            cardProvider.isProductInCardd(
                                    productId: productModel.productId)
                                ? Icons.check
                                : Icons.shopping_cart_outlined,
                          )),
                    ],
                  ),
                  FittedBox(
                      child: SubtitleTextWidget(
                          label: "${productModel.productPrice}\$"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
