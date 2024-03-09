import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_app_en/pages/card_page/bottom_checkout_widget.dart';
import 'package:ecommerce_app_en/pages/card_page/card_widget.dart';
import 'package:ecommerce_app_en/pages/search_page.dart';
import 'package:ecommerce_app_en/providers/viewed_recently_provider.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/empty_card_widget.dart';
import 'package:ecommerce_app_en/widgets/products/product_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../../services/app_functions.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const String rootName = "/viewed_recently";
  const ViewedRecentlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    return viewedRecentlyProvider.getLastViewedItems.isEmpty
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
                func: () {
                  Navigator.pushNamed(context, SearchPage.rootName);
                }))
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
              title: SubtitleTextWidget(
                  label:
                      "Viewed Recently(${viewedRecentlyProvider.getLastViewedItems.length})"),
              actions: [
                IconButton(
                    onPressed: () {
                      AppFunctions.showErrorOrWarningDialog(
                          isError: false,
                          context: context,
                          func: () {
                            return viewedRecentlyProvider
                                .clearLocalLastViewedList();
                          },
                          title: "Clear last viewed products?");
                    },
                    icon: const Icon(Icons.delete_forever))
              ],
            ),
            body: DynamicHeightGridView(
                physics: const BouncingScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                builder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductsWidget(
                      productId: viewedRecentlyProvider
                          .getLastViewedItems.values
                          .toList()[index]
                          .productId,
                    ),
                  );
                },
                itemCount: viewedRecentlyProvider.getLastViewedItems.length,
                crossAxisCount: 2));
  }
}
