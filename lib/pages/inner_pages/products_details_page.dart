import 'package:ecommerce_app_en/consts/app_consts.dart';
import 'package:ecommerce_app_en/widgets/app_name_text_widget.dart';
import 'package:ecommerce_app_en/widgets/products/heart_button_widget.dart';
import 'package:ecommerce_app_en/widgets/products/material_button_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/card_provider.dart';
import '../../providers/product_provider.dart';
import '../../providers/viewed_recently_provider.dart';

class ProductDetails extends StatelessWidget {
  static const String rootName = "/products";
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurProduct = productProvider.findByProductId(productId!);
    final cardProvider = Provider.of<CardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const AppNameTextWidget(title: "Best Shop"),
        centerTitle: true,
      ),
      body: getCurProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: FancyShimmerImage(
                        imageUrl: getCurProduct.productImage,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Text(
                            getCurProduct.productTitle,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SubtitleTextWidget(
                          label: "${getCurProduct.productPrice}\$",
                          fontSize: 18,
                          color: Colors.blue,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        HeartButtonWidget(
                          productId: productId,
                          size: 28,
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {
                                if (cardProvider.isProductInCardd(
                                    productId: getCurProduct.productId)) {
                                  return;
                                }
                                cardProvider.addToCard(
                                    productId: getCurProduct.productId);
                              },
                              icon: cardProvider.isProductInCardd(
                                      productId: getCurProduct.productId)
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.shopping_basket_outlined),
                              label: cardProvider.isProductInCardd(
                                      productId: getCurProduct.productId)
                                  ? const SubtitleTextWidget(
                                      label: "Added to card")
                                  : const SubtitleTextWidget(
                                      label: "Add to card")),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                            child: TitleTextWidget(
                                label: getCurProduct.productCategory))),
                    const SizedBox(
                      height: 15,
                    ),
                    SubtitleTextWidget(label: getCurProduct.productDescription),
                  ],
                ),
              ),
            ),
    );
  }
}
