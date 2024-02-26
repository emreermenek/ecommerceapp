import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_app_en/pages/card_page/bottom_checkout_widget.dart';
import 'package:ecommerce_app_en/pages/card_page/card_widget.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/empty_card_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:ecommerce_app_en/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_name_text_widget.dart';
import '../../widgets/products/product_widget.dart';

class WishlistPage extends StatelessWidget {
  static const String rootName = "/wishlist";
  const WishlistPage({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
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
            ),
            body: EmptyCardWidget(
                image: ImagesManager.shoppingBasket,
                title: "WHOPPSS",
                subtitle1: "Your wishlist is empty!",
                subtitle2: "You might want to look for new products",
                buttonText: "Search Products",
                func: () {}))
        : Scaffold(
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
                title: const SubtitleTextWidget(label: "Wishlist(6)")),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicHeightGridView(
                  physics: const BouncingScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 12,
                  builder: (context, index) {
                    return const ProductsWidget();
                  },
                  itemCount: 16,
                  crossAxisCount: 2),
            ));
  }
}
