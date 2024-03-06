import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/card_provider.dart';

class BottomCheckoutWidget extends StatelessWidget {
  const BottomCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextWidget(
                      label:
                          "Total(${cardProvider.getCardItems.length} Products/${cardProvider.totalQuantity()} items)",
                      fontSize: 16,
                    ),
                    const Spacer(),
                    SubtitleTextWidget(
                      label:
                          "${cardProvider.totalPrice(productProvider: productProvider)}\$",
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const SubtitleTextWidget(
                  label: "Checkout",
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
