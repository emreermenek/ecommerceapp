import 'package:ecommerce_app_en/models/product_model.dart';
import 'package:ecommerce_app_en/providers/product_provider.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/products/product_widget.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            leading: Image.asset(ImagesManager.shoppingBasket),
            title: const SubtitleTextWidget(label: "Search Products"),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.delete_forever))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            searchController.clear();
                            FocusScope.of(context).unfocus();
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ))),
                ),
                Expanded(
                  child: DynamicHeightGridView(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 12,
                      builder: (context, index) {
                        return ProductsWidget(
                          productId:
                              productProvider.getProducts[index].productId,
                        );
                      },
                      itemCount: productProvider.getProducts.length,
                      crossAxisCount: 2),
                ),
              ],
            ),
          )),
    );
  }
}
