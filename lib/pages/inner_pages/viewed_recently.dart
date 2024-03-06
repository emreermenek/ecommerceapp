import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_app_en/pages/card_page/bottom_checkout_widget.dart';
import 'package:ecommerce_app_en/pages/card_page/card_widget.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/empty_card_widget.dart';
import 'package:ecommerce_app_en/widgets/products/product_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const String rootName = "/viewed_recently";
  const ViewedRecentlyScreen({super.key});

  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
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
                subtitle1: "Your viewed recently is empty!",
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
              title: const SubtitleTextWidget(label: "Viewed Recently(2)"),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_forever))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicHeightGridView(
                  physics: const BouncingScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 12,
                  builder: (context, index) {
                    return const ProductsWidget(
                      productId: "",
                    );
                  },
                  itemCount: 16,
                  crossAxisCount: 2),
            ));
  }
}
