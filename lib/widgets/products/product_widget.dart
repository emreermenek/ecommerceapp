import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/pages/inner_pages/products_details_page.dart';
import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:ecommerce_app_en/widgets/products/material_button_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/card_provider.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    //final productModelProvider = Provider.of<ProductModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurProduct = productProvider.findByProductId(productId);
    final size = MediaQuery.of(context).size;
    final cardProvider = Provider.of<CardProvider>(context);
    return getCurProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, ProductDetails.rootName,
                    arguments: getCurProduct.productId);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      imageUrl: getCurProduct.productImage,
                      height: size.height * 0.25,
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 5,
                        child: TitleTextWidget(
                          label: getCurProduct.productTitle,
                          fontSize: 16,
                          maxLines: 2,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SubtitleTextWidget(
                          label: "${getCurProduct.productPrice}\$",
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      MaterialButtonWidget(
                        size: 20,
                        padding: 5.5,
                        color: Colors.lightBlue.shade300,
                        borderRadius: 25,
                        icon: cardProvider.isProductInCardd(
                                productId: getCurProduct.productId)
                            ? Icons.check
                            : Icons.shopping_cart_outlined,
                        func: () {
                          if (cardProvider.isProductInCardd(
                              productId: getCurProduct.productId)) {
                            return;
                          }
                          cardProvider.addToCard(
                              productId: getCurProduct.productId);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
